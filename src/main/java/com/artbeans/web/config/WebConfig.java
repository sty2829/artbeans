package com.artbeans.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.artbeans.web.interceptor.AuthInterceptor;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private AuthInterceptor authInterceptor;
	
	private final String UPLOAD_PATH = "/upload/**";
	
	@Value("${webconfig.path.gallery}")
	private String gallery;
	
	@Value("${webconfig.path.exhibition}")
	private String exhibition;
	
	@Value("${webconfig.path.editor}")
	private String editor;
	
	@Value("${webconfig.path.review}")
	private String review;
	
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
		.excludePathPatterns("/views/exhibition/*")
		.excludePathPatterns("/views/gallery/**")
		.excludePathPatterns("/views/include/**")
		.excludePathPatterns("/views/search/**")
		.addPathPatterns("/views/**");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(UPLOAD_PATH)
		.addResourceLocations(gallery)
		.addResourceLocations(exhibition)
		.addResourceLocations(editor)
		.addResourceLocations(review);
	}

	

	

	
	
}
