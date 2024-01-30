package com.tanda.myblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.tanda.myblog.dto.ResponseDto;
import com.tanda.myblog.model.User;
import com.tanda.myblog.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired UserService userService;
	
	@PutMapping("/user/nickname")
	public ResponseDto<Integer> updateNickname(@RequestBody User user){
		userService.닉네임수정(user);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/user/password")
	public ResponseDto<Integer> updatePassword(@RequestBody User user){
		userService.비밀번호수정(user);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}
