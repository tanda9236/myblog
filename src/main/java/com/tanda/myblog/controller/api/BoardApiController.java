package com.tanda.myblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tanda.myblog.config.auth.PrincipalDetails;
import com.tanda.myblog.dto.ReplySaveRequestDto;
import com.tanda.myblog.dto.ResponseDto;
import com.tanda.myblog.model.Board;
import com.tanda.myblog.model.LikeBoard;
import com.tanda.myblog.service.BoardService;

@RestController
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetails principal) {
		boardService.글쓰기(board, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 게시글 작성
	
	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		boardService.글삭제(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 게시글 삭제
	
	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Board board){
		boardService.글수정(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 게시글 수정
	
	@PostMapping("/api/board/{boardId}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {	
		boardService.댓글쓰기(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 댓글 작성
	
	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyId) {
		boardService.댓글삭제(replyId);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 댓글 삭제
	
	@PostMapping("/api/board/{boardId}/like")
	public ResponseDto<Integer> likeBoard(@PathVariable int boardId,@RequestBody LikeBoard likeBoard, @AuthenticationPrincipal PrincipalDetails principal) {
	    boardService.좋아요추가(principal.getUser(), boardId, likeBoard);
	    return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}// 좋아요 추가
	
	 @DeleteMapping("/api/board/{boardId}/unlike")
	 public ResponseDto<Integer> unlikeBoard(@PathVariable int boardId, @AuthenticationPrincipal PrincipalDetails principal) {
		 boardService.좋아요취소(boardId, principal.getUser().getId());
		 return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 좋아요 취소

	
}
