package com.tanda.myblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tanda.myblog.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	public User findByUsername(String username);
}
