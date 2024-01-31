package com.tanda.myblog.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tanda.myblog.model.User;
import com.tanda.myblog.repository.UserRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	public int 회원가입(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setNickname("닉네임#" + userRepository.count());
		user.setPassword(encPassword);
		user.setRole("ROLE_USER");
		try {
			userRepository.save(user);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}// 회원가입
	
	@Transactional(readOnly = true)
	public User 프로필(int id) {
		return userRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("프로필보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}// 유저정보
	
	@Transactional
	public void 닉네임수정(User user) {
		User persistance = userRepository.findById(user.getId())
				.orElseThrow(()->{
					return new IllegalArgumentException("회원찾기 실패 : 아이디를 찾을 수 없습니다.");
				});
		persistance.setNickname(user.getNickname());
	}// 프로필 수정(닉네임)
	
	@Transactional
	public void 비밀번호수정(User user) {
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		User persistance = userRepository.findById(user.getId())
				.orElseThrow(()->{
					return new IllegalArgumentException("회원찾기 실패 : 아이디를 찾을 수 없습니다.");
				});
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		persistance.setPassword(encPassword);
		persistance.setUpdateDate(currentTime);
	}// 프로필 수정(비밀번호)
}