package com.tanda.myblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tanda.myblog.dto.ResponseDto;
import com.tanda.myblog.model.User;
import com.tanda.myblog.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired UserService userService;
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) { 
		System.out.println("UserApiController : save 호출");
		userService.회원가입(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 회원가입
	
	@PutMapping("/user/nickname")
	public ResponseDto<Integer> updateNickname(@ModelAttribute User user, @RequestParam(value = "file", required = false) MultipartFile file) throws Exception {
		if (file != null && !file.isEmpty()) {
			userService.닉네임수정(user, file); // 파일 O
	    } else {
	        userService.닉네임수정(user); // 파일 X
	    }
	    return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}// 프로필 수정(닉네임, 이미지)
	
	@PutMapping("/user/password")
	public ResponseDto<Integer> updatePassword(@RequestBody User user){
		userService.비밀번호수정(user);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 프로필 수정(비밀번호)
}
