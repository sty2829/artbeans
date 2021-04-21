package com.artbeans.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.artbeans.web.interceptor.AuthInterceptorAdmin;

@Configuration
public class WebConfigAdmin implements WebMvcConfigurer {
	
	@Autowired
	private AuthInterceptorAdmin authInterceptorAdmin;
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptorAdmin)
		.excludePathPatterns("/resources/**")
		.excludePathPatterns("/views/admin/admin-login")
		.excludePathPatterns("/views/admin/admin-msg")
		.excludePathPatterns("/views/admin/questions")
		.excludePathPatterns("/views/admin/usinghomepage")
		.addPathPatterns("/views/admin/*");
	}
}
