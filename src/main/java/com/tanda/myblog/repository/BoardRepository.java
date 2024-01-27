package com.tanda.myblog.repository;


import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.tanda.myblog.model.Board;


public interface BoardRepository extends JpaRepository<Board, Integer>{
	
	// 유저별 블로그
	Page<Board> findByUserId(Integer id, Pageable pageable);
	
	// 상세보기
	Optional<Board> findByUserIdAndId(Integer userId, Integer id);
	
}