package com.dhsp.dhspservice.bean.aspect;

import com.alibaba.fastjson.JSONObject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

@Aspect
@Component
public class ControllerSectionMonitor {

    private static final ThreadLocal<Long> timeTreadLocal = new ThreadLocal<>();

    private static final Logger logger = LoggerFactory.getLogger("oneca");

    @Pointcut("execution(* com.dhsp.dhspservice.controller.*.*(..))")
    public void log() {
        System.out.println("hahahahahaha");
    }

    @Before("log()")
    public void before(JoinPoint joinPoint) {
        timeTreadLocal.set(System.currentTimeMillis());
        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        //获取请求的request
        HttpServletRequest request = attributes.getRequest();
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        //获取被拦截的方法
        Method method = methodSignature.getMethod();
        //获取被拦截的方法名
        String methodName = method.getName();
        logger.info("====================>> Method Name：" + methodName + "()");
        logger.info("========== url = "+ request.getRequestURL().toString());
        logger.info("========== type = "+ request.getMethod());
    }

    @After("log()")
    public void after() {
    }

    /**
     * controller请求结束返回时调用
     */
    @AfterReturning(returning = "result", pointcut = "log()")
    public Object afterReturn(Object result) {
        logger.info("========== return result = "+ JSONObject.toJSON(result).toString());
        long startTime = timeTreadLocal.get();
        double callTime = (System.currentTimeMillis() - startTime) / 1000.0;
        logger.info("========== time = "+ callTime+" s");
        timeTreadLocal.remove();
        return result;
    }

}
