package com.artbeans.web.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.artbeans.web.dto.ResponseResult;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class ResponseAOP {

	@Around("execution(com.artbeans.web.dto.ResponseResult com.artbeans.web.controller.*Controller.*(..))")
	public Object setResponse(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj = pjp.proceed();
		Integer count = (Integer)returnObj;
		ResponseResult result = new ResponseResult();
		if(count >= 1) {
			result.setResult(true);
			result.setCount(count);
			result.setMsg("정상 수행 완료");
		}else {
			result.setResult(false);
			result.setCount(count);
			result.setMsg("정상 값이 아님..");
		}
		
		return result;
	}	
}
