package com.artbeans.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.artbeans.web.interceptor.AuthInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private AuthInterceptor authInterceptor;
	
	public  void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor)
		.excludePathPatterns("/views/user/login")
		.excludePathPatterns("/views/user/msg")
		.excludePathPatterns("/views/user/register")
		.excludePathPatterns("/views/user/forgetId")
		.excludePathPatterns("/views/user/forgetPwd")
		.excludePathPatterns("/views/user/findPwd")
		.excludePathPatterns("/views/admin/**")
		.excludePathPatterns("/views/community/**")
		.excludePathPatterns("/views/exhibition/**")
		.excludePathPatterns("/views/gallery/**")
		.excludePathPatterns("/views/include/**")
		.excludePathPatterns("/views/search/**")
		.addPathPatterns("/views/**");
	}
	
}
