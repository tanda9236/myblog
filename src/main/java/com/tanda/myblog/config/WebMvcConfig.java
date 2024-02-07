package com.tanda.myblog.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	// web root 아닌 외부 경로 리소스 url로 불러오기 가능
	// localhost:8080/폴더명/파일명.jpg => C:/폴더명/파일명.jpg
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/summernoteImage/**")
//                .addResourceLocations("file:///C:/workspace/myProjectFile/summernote_image/");
        
//        registry.addResourceHandler("/profileImage/**")
//        		.addResourceLocations("file:///C:/workspace/myProjectFile/profile_image/");
    }// 경로수정시 FileManageController 확인
	
}// S3 저장으로 안쓰는중
