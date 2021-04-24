package com.artbeans.web.aop;

import java.lang.reflect.Method;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.artbeans.web.dto.UserSession;
import com.artbeans.web.entity.UserInfo;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class UserSessionAOP {

	@Around("execution(* com.artbeans.web.controller.*Controller.*(com.artbeans.web.dto.UserSession,..))")
	public Object getCurrentUser(ProceedingJoinPoint pjp) throws Throwable {
		HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
		log.info("userInfo => {}", userInfo);
		if(userInfo == null) {
			throw new RuntimeException("다시 로그인 해주세요");
		}
		Integer uiNum = userInfo.getUiNum();
		UserSession userSession = new UserSession();
		userSession.setUiNum(uiNum);
		String parameterName = "";
		
		Object[] args = pjp.getArgs();
	    MethodSignature signature = (MethodSignature) pjp.getSignature();
        Method method = signature.getMethod();
        
        for (int i = 0; i < method.getParameters().length; i++) {
            parameterName = method.getParameters()[i].getName();
            if (parameterName.equals("userSession")) {
            	args[i] = userSession;
            }
        }
		return pjp.proceed(args);
	}	
}
