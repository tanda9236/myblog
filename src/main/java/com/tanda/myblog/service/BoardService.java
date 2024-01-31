package com.tanda.myblog.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tanda.myblog.dto.ReplySaveRequestDto;
import com.tanda.myblog.model.Board;
import com.tanda.myblog.model.User;
import com.tanda.myblog.repository.BoardRepository;
import com.tanda.myblog.repository.ReplyRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardRepository boardRepository;
	private final ReplyRepository replyRepository;
	
	@Transactional
	public void 글쓰기(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}// 게시글 작성
	
	@Transactional(readOnly = true)
	public Page<Board> 글목록(Pageable pageable){
		return boardRepository.findAll(pageable);
	}// 전체 게시글 목록
	
	@Transactional(readOnly = true)
	public Page<Board> 유저별글목록(int id, Pageable pageable) {
	    return boardRepository.findByUserId(id, pageable);
	}// 유저별 글 목록
	
	@Transactional(readOnly = true)
	public Board 글상세보기(int userId, int id) {
		return boardRepository.findByUserIdAndId(userId, id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}// 게시글 상세보기
	
	@Transactional(readOnly = true)
	public Board 글상세보기(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}// 게시글 상세보기(수정페이지)
	
	@Transactional
	public void 글수정(int id, Board requestBoard) {
		Board board = boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
				});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}// 게시글 수정
	
	@Transactional
	public void 글삭제(int id) {
		System.out.println("글삭제:"+id);
		boardRepository.deleteById(id);
	}// 게시글 삭제
	
	@Transactional
	public void 댓글쓰기(ReplySaveRequestDto replySaveRequestDto) {
		int result = replyRepository.replySave(replySaveRequestDto.getUserId(),replySaveRequestDto.getBoardId(),replySaveRequestDto.getContent());
		System.out.println("BoardService : "+result);
	}// 댓글 작성
	
	@Transactional
	public void 댓글삭제(int replyId) {
		replyRepository.deleteById(replyId);
	}// 댓글 삭제
	

}
