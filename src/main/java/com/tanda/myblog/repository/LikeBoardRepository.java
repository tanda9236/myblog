package com.tanda.myblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.tanda.myblog.model.LikeBoard;
import com.tanda.myblog.model.Reply;

public interface LikeBoardRepository extends JpaRepository<LikeBoard, Integer>{

	// 좋아요 추가
	@Query(value = "SELECT CASE WHEN EXISTS (SELECT * FROM likeboard WHERE boardId = ?1 AND (userId = ?2 OR userId IS NULL)) THEN 1 ELSE 0 END AS result", nativeQuery = true)
	int findByBoardId(int boardId, Integer userId);
	
	// 좋아요 취소
	@Modifying
	@Query(value = "DELETE FROM likeboard WHERE boardId = ?1 AND userId = ?2", nativeQuery = true)
	int unlike(int boardId, int userId);
}
