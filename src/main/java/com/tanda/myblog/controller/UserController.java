package com.tanda.myblog.controller;

import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tanda.myblog.config.auth.PrincipalDetails;
import com.tanda.myblog.model.User;
import com.tanda.myblog.repository.UserRepository;
import com.tanda.myblog.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("/loginForm")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception, Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		System.out.println("login error : " + error);
		System.out.println("login exception : " + exception);
		return "/user/loginForm";
	}// 로그인 화면

	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}// 회원가입 화면
	
	@PostMapping("/join")
	public String join(User user) {
		System.out.println(user);
		user.setRole("ROLE_USER");
		user.setNickname("닉네임#" + userRepository.count()); //
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		userRepository.save(user);
		return "redirect:/loginForm";
	}// 회원가입

	@GetMapping("/profile/{id}")
	public String userProfile(@PathVariable int id, Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		model.addAttribute("user", userService.프로필(id));
		if (principal != null && principal.getUser().getId() == id) {
			return "user/userProfile";
		}
		return "redirect:/";
	}// 프로필 수정(닉네임)
	
	@GetMapping("/password/{id}")
	public String userPassword(@PathVariable int id, Model model, @AuthenticationPrincipal PrincipalDetails principal) {
		model.addAttribute("user", userService.프로필(id));
		if (principal != null 
			&& principal.getUser().getId() == id
			&& principal.getUser().getProvider() == null) {
			System.out.println("Oauth? : "+principal.getUser().getProvider());
			
			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			Timestamp updateDate = principal.getUser().getUpdateDate();
			long diffMillis = currentTime.getTime() - updateDate.getTime();
		    long diffDays = TimeUnit.MILLISECONDS.toDays(diffMillis);
		    System.out.println(currentTime);
		    System.out.println(updateDate);
		    System.out.println(diffMillis);
		    System.out.println(diffDays);
		    model.addAttribute("currentTime", currentTime);
		    model.addAttribute("diffDays", diffDays);
			return "user/userPassword";
		}
		return "redirect:/";
	}// 프로필 수정(비밀번호)

}
