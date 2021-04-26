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
	
	private final String UPLOAD_PATH = "/resource/**";
	
	@Value("${webconfig.path.gallery}")
	private String GALLERY_PATH;
	
	@Value("${webconfig.path.exhibition}")
	private String EXHIBITION_PATH;
	
	@Value("${webconfig.path.editor}")
	private String EDITOR_PATH;
	
	@Value("${webconfig.path.review}")
	private String REVIEW_PATH;
	
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
		.addResourceLocations(GALLERY_PATH)
		.addResourceLocations(EXHIBITION_PATH)
		.addResourceLocations(EDITOR_PATH)
		.addResourceLocations(REVIEW_PATH);
	}

	

	

	
	
}
