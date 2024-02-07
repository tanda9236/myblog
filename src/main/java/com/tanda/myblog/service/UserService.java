package com.tanda.myblog.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.tanda.myblog.model.User;
import com.tanda.myblog.repository.UserRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	private final AmazonS3 amazonS3;
	
	@Value("${cloud.aws.s3.bucketname}")
	private String bucketName;
	
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

	private String changedImageName(String originName) {
        String random = UUID.randomUUID().toString();
        return random + originName.substring(originName.lastIndexOf("."));
    }// 이미지 이름 중복방지 랜덤생성
	
	private String uploadImageToS3(MultipartFile file) {
        String originName = file.getOriginalFilename();
        String changedName = changedImageName(originName);
        
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentType(file.getContentType());
        metadata.setContentLength(file.getSize());
        
        try {
            amazonS3.putObject(new PutObjectRequest(bucketName, changedName, file.getInputStream(), metadata)
                    .withCannedAcl(CannedAccessControlList.PublicRead));
        } catch (IOException e) {
            throw new IllegalArgumentException("이미지 업로드 중 오류 발생", e);
        }
        
        return amazonS3.getUrl(bucketName, changedName).toString();
    }// 이미지 S3에 업로드 후 url 반환

	@Transactional
    public User 닉네임수정(User user, MultipartFile file) {
        User persistence = userRepository.findById(user.getId())
                .orElseThrow(() -> new IllegalArgumentException("회원을 찾을 수 없습니다."));
        String profileName = file.getOriginalFilename();
        String profilePath = uploadImageToS3(file);
        if (user.getProfilePath() != null) {
        	deleteImage(persistence.getProfilePath());
        }
        persistence.setProfileName(profileName);
        persistence.setProfilePath(profilePath);
        persistence.setNickname(user.getNickname());
	    persistence.setIntro(user.getIntro());
        userRepository.save(persistence);

        return persistence;
    }// 프로필 수정 (닉네임, 사진, 소개)
	
	public void deleteImage(String profilePath) {
		String splitStr = ".com/";
        String key = profilePath.substring(profilePath.lastIndexOf(splitStr) + splitStr.length());
        DeleteObjectRequest deleteRequest = new DeleteObjectRequest(bucketName, key);
        amazonS3.deleteObject(deleteRequest);
    }// (이미지 수정시 S3 이미지 삭제)
	
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