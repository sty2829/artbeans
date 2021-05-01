package com.artbeans.web.aop;

import java.lang.reflect.Method;

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

@Component
@Aspect
public class UserSessionAOP {
	@Around("execution(* com.artbeans.web.controller.*Controller.*(com.artbeans.web.dto.UserSession,..))")
	public Object getCurrentUser(ProceedingJoinPoint pjp) throws Throwable {
		HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession(); //세션을 만들어준다
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo"); //세션에서 userInfo를 가져와서 캐스팅후 여기서 만든 userInfo에 넣어준다.
		
		if(userInfo == null) {
			throw new RuntimeException("다시 로그인 해주세요");
		}
		Integer uiNum = userInfo.getUiNum(); //userInfo에서 uiNum을 뽑아서 넣어준다.
		UserSession userSession = new UserSession();
		userSession.setUiNum(uiNum);
		String parameterName = "";
		
		Object[] args = pjp.getArgs(); //userSession이후의 매개변수들을 배열에 넣어준다
	    MethodSignature signature = (MethodSignature) pjp.getSignature();//매개변수들의 이름을 가져온다
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
