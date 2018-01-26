package com.jd.orange.common;

import com.jd.orange.model.Admin;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

@Aspect
@Component
public class AdminAspect {

    private static final Logger logger = Logger.getLogger(AdminAspect.class);

    /* 此方式会导致Junit测试注入失败*/
//    @Autowired
//    private HttpSession session;

    /**
     * 定义Pointcut，Pointcut的名称，此方法不能有返回值，该方法只是一个标示
     */
    @Pointcut(value = "@annotation(com.jd.orange.common.AdminCheck)" )
    public void controllerAspect()
    {

        //System.out.println("我是一个切入点");
    }

    /**
     * 前置通知（Before advice） ：在某连接点（JoinPoint）之前执行的通知，但这个通知不能阻止连接点前的执行。
     * @param joinPoint
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint)
    {
        //System.out.println("=====AdminAspect前置通知开始=====");
        //handleLog(joinPoint, null);
    }

    /**
     * 后通知（After advice） ：当某连接点退出的时候执行的通知（不论是正常返回还是异常退出）。
     * @param joinPoint
     */
    @AfterReturning(pointcut = "controllerAspect()")
    public void doAfter(JoinPoint joinPoint)
    {
        //System.out.println("=====AdminAspect后置通知开始=====");
        //handleLog(joinPoint, null);
    }

    /**
     * 抛出异常后通知（After throwing advice） ： 在方法抛出异常退出时执行的通知。
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(value = "controllerAspect()", throwing = "e")
    public void doAfter(JoinPoint joinPoint, Exception e)
    {
        System.out.println("=====AdminAspect异常通知开始=====");
        //handleLog(joinPoint, e);
    }

    /**
     * 环绕通知（Around advice） ：包围一个连接点的通知，类似Web中Servlet规范中的Filter的doFilter方法。可以在方法的调用前后完成自定义的行为，也可以选择不执行。
     * @param pjp
     */
    @Around("controllerAspect()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable
    {
        HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session =request.getSession();
        Admin admin= (Admin) session.getAttribute("admin");
        String methodName=pjp.getSignature().getName();
        Integer level = 0;
        //获取注解属性
        Class<?> classTarget=pjp.getTarget().getClass();
        Class<?>[] par=((MethodSignature) pjp.getSignature()).getParameterTypes();
        Method objMethod=classTarget.getMethod(methodName, par);
        AdminCheck adminCheck=objMethod.getAnnotation(AdminCheck.class);
        if(adminCheck!=null){
            level = adminCheck.value().value() ;
            //System.out.println(adminCheck.value().value());
        }


        if(admin == null) {
            logger.info("-------------没有登录-------------");
            return "redirect:/login/AdminSignIn";
        }
        else {
            Integer al = admin.getLevel();
            if(al==null)
            {
                logger.info("-------------帐号错误-------------");
                return "redirect:/login/AdminSignIn";
            }
            if( al < level )
            {
                logger.info("-------------权限不足-------------");
                return "redirect:/admin/lack";
            }

        }
        return pjp.proceed();

        /*
        Object result = null;
        String targetName = pjp.getTarget().getClass().getSimpleName();
        String methodName = pjp.getSignature().getName();

        //Map<String,String> map=loadVlaue(pjp.getClass(),"level",targetName);
        //System.out.println(map.toString());

        logger.info("----------------执行方法-----------------");
        logger.info("类名："+targetName+" 方法名："+methodName);
        HttpServletResponse response = null;
        for (Object param : pjp.getArgs()) {
            if (param instanceof HttpServletResponse) {
                response = (HttpServletResponse) param;
            }
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();

        ServletWebRequest servletWebRequest=new ServletWebRequest(request);
        if(response==null)
        {
            response=servletWebRequest.getResponse();
        }

        if(session.getAttribute("admin")!=null)
        {
            try {
                result = pjp.proceed();
            } catch (Throwable e) {
                e.printStackTrace();
                request.getRequestDispatcher("/WEB-INF/jsp/manager/login.jsp").forward(request,response);
            }
            return result;
        }
        else
        {
            logger.debug("Session已超时，正在跳转回登录页面");
            //response.sendRedirect(request.getContextPath());
            //request.getRequestDispatcher("/WEB-INF/jsp/manager/login.jsp").forward(request,response);
            response.sendRedirect("/WEB-INF/jsp/manager/login.jsp");
        }
        return result; */

//        System.out.println("=====SysLogAspect 环绕通知开始=====");
//        //handleLog(joinPoint, null);
//        Object obj= joinPoint.proceed();
//
//
//
//        System.out.println("=====SysLogAspect 环绕通知结束=====");
//        return  obj;
    }

    /**
     * 日志处理
     *
     * @param joinPoint
     * @param e
     */
    private void handleLog(JoinPoint joinPoint, Exception e)
    {
        try
        {
            //获得注解
            AdminCheck logger = giveController(joinPoint);
            if (logger == null)
            {
                return;
            }

            String signature = joinPoint.getSignature().toString(); // 获取目标方法签名
            String methodName = signature.substring(signature.lastIndexOf(".") + 1,
                    signature.indexOf("("));

            String longTemp = joinPoint.getStaticPart().toLongString();
            String classType = joinPoint.getTarget().getClass().getName();

            Class<?> clazz = Class.forName(classType);

            Method[] methods = clazz.getDeclaredMethods();
            System.out.println("methodName: " + methodName);

            for (Method method : methods)
            {
                if (method.isAnnotationPresent(AdminCheck.class)
                        && method.getName().equals(methodName))
                {
                    //OpLogger logger = method.getAnnotation(OpLogger.class);
                    String clazzName = clazz.getName();
                    System.out.println("clazzName: " + clazzName + ", methodName: "
                            + methodName);
                }
            }

        } catch (Exception exp)
        {
            logger.error("异常信息:{}", exp);
            exp.printStackTrace();
        }
    }

    /**
     * 获得注解
     * @param joinPoint
     * @return
     * @throws Exception
     */
    private static AdminCheck giveController(JoinPoint joinPoint) throws Exception
    {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null)
        {
            return method.getAnnotation(AdminCheck.class);
        }
        return null;
    }


    public Map<String, String> loadVlaue(Class annotationClasss,String annotationField, String className) throws Exception {

        Map<String, String> map = new HashMap<String, String>();
        Method[] methods = Class.forName(className).getDeclaredMethods();
        for (Method method : methods) {
            if (method.isAnnotationPresent(annotationClasss)) {
                Annotation p = method.getAnnotation(annotationClasss);
                Method m = p.getClass().getDeclaredMethod(annotationField, null);
                String[] values = (String[]) m.invoke(p, null);
                for (String key : values) {
                    System.out.println("注解值 === " + key);
                    map.put(key, key);
                }
            }
        }
        //System.out.println("map数量  === " + map.size());
        return map;
    }

}
