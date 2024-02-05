package com.tanda.myblog.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	public User 닉네임수정(User user) {
		User persistence = userRepository.findById(user.getId())
				.orElseThrow(()->{
					return new IllegalArgumentException("회원찾기 실패 : 아이디를 찾을 수 없습니다.");
				});
		persistence.setNickname(user.getNickname());
		persistence.setIntro(user.getIntro());
		return persistence; // 변경된 사용자 객체 반환
	}// 프로필 수정(닉네임)
	
	@Transactional
	public User 닉네임수정(User user, MultipartFile file) throws Exception {
	    User persistence = userRepository.findById(user.getId())
	            .orElseThrow(() -> {
	                return new IllegalArgumentException("회원찾기 실패 : 아이디를 찾을 수 없습니다.");
	            });

	    // 새 파일 저장
	    UUID uuid = UUID.randomUUID();
	    String newFileName = uuid + "_" + file.getOriginalFilename();
	    String projectPath = "C:\\workspace\\myProjectFile\\profile_image\\";
	    File newSaveFile = new File(projectPath, newFileName);
	    file.transferTo(newSaveFile);

	    // 이전 파일 삭제
	    if (persistence.getProfileName() != null) {
	        File oldFile = new File(projectPath, persistence.getProfileName());
	        if (oldFile.exists()) {
	            oldFile.delete();
	        }
	    }// 프로필 수정(닉네임, 소개, 이미지)

	    System.out.println("새 파일 이름: " + newFileName);
	    persistence.setProfileName(newFileName);
	    persistence.setProfilePath("/profileImage/" + newFileName);
	    persistence.setNickname(user.getNickname());
	    persistence.setIntro(user.getIntro());

	    return persistence; // 변경된 사용자 객체 반환
	}

	
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
	
	@Transactional(readOnly = true)
	public List<User> 유저목록(){
		return userRepository.findAll();
	}// 전체 유저 목록
	
}