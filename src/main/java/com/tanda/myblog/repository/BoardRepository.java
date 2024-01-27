package com.tanda.myblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tanda.myblog.model.Board;


public interface BoardRepository extends JpaRepository<Board, Integer>{

}