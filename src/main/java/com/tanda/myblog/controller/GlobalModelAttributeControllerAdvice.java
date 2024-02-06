package com.tanda.myblog.controller;

import java.util.List;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.tanda.myblog.model.User;
import com.tanda.myblog.service.UserService;

@ControllerAdvice // 전역적으로 핸들링 가능한 어노테이션 (GlobalExceptionHandler)
public class GlobalModelAttributeControllerAdvice {

	private final UserService userService;

	public GlobalModelAttributeControllerAdvice(UserService userService) {
		this.userService = userService;
	}

	@ModelAttribute("users")
	public List<User> populateUserList() {
		return userService.유저목록();
	}
}
