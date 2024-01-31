package com.tanda.myblog.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, unique = true)
	private String username;
	
	@Column(nullable = false, length = 100)
	private String password;
	
	@Column(nullable = false, length = 50)
	private String email;
	
	private String nickname;
	
	private String role;
	
	private String provider;
	private String providerId;
	
	@CreationTimestamp
	private Timestamp createDate;

	@CreationTimestamp
	private Timestamp updateDate;
	
	@Builder
	public User(String username, String password, String email, String nickname, String role, String provider, String providerId,
			Timestamp createDate, Timestamp updateDate) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.role = role;
		this.provider = provider;
		this.providerId = providerId;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
}
