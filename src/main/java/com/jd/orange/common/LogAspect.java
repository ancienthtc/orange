package com.jd.orange.common;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Aspect
@Component
public class LogAspect {

    private static final Logger logger = Logger.getLogger(LogAspect.class);

    @Pointcut("@annotation(com.jd.orange.common.LogAnnotation)")
    public void controllerAspect()
    {

    }

    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint)
    {
        logger.info("=====LogAspect前置通知开始=====");
        logger.info(java.util.Calendar.getInstance().getTime());
    }

    @AfterReturning(pointcut = "controllerAspect()")
    public void doAfter(JoinPoint joinPoint)
    {
        logger.info("=====LogAspect后置通知开始=====");
        logger.info(java.util.Calendar.getInstance().getTime());
    }

    @AfterThrowing(value = "controllerAspect()", throwing = "e")
    public void doAfter(JoinPoint joinPoint, Exception e)
    {
        logger.info("=====LogAspect异常通知开始=====");
        logger.info(java.util.Calendar.getInstance().getTime());
    }

    @Around("controllerAspect()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable
    {
        logger.info("=====LogAspect环绕通知开始=====");
        logger.info(java.util.Calendar.getInstance().getTime());
        return pjp.proceed();
    }

}
