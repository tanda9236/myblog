package com.tanda.myblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.tanda.myblog.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{

	// 댓글 작성
	@Modifying
	@Query(value="INSERT INTO reply(userId,boardId,content,createDate) VALUES(?1,?2,?3,now())", nativeQuery = true)
	int replySave(int userId, int boardId, String content);
}
