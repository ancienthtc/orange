package com.jd.orange.common;

import com.jd.orange.model.User;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Aspect
@Component
public class UserAspect {

    private static final Logger logger = Logger.getLogger(UserAspect.class);

    @Pointcut("@annotation(com.jd.orange.common.UserCheck)")
    public void controllerAspect()
    {

    }

    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint)
    {
        //System.out.println("=====AdminAspect前置通知开始=====");
        //handleLog(joinPoint, null);
    }

    @AfterReturning(pointcut = "controllerAspect()")
    public void doAfter(JoinPoint joinPoint)
    {
        //System.out.println("=====AdminAspect后置通知开始=====");
        //handleLog(joinPoint, null);
    }

    @AfterThrowing(value = "controllerAspect()", throwing = "e")
    public void doAfter(JoinPoint joinPoint, Exception e)
    {
        System.out.println("=====AdminAspect异常通知开始=====");
        //handleLog(joinPoint, e);
    }

    @Around("controllerAspect()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable
    {
        HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session =request.getSession();
        //HttpSession session=null;
        User user= (User) session.getAttribute("user");

        if(user == null) {
            logger.info("-------------用户没有登录-------------");
            return "redirect:/login/login";
        }
        return pjp.proceed();
    }

}
