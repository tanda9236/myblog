package com.tanda.myblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.tanda.myblog.config.auth.PrincipalDetails;
import com.tanda.myblog.dto.ResponseDto;
import com.tanda.myblog.model.Board;
import com.tanda.myblog.service.BoardService;

@RestController
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetails principal) {
		boardService.글쓰기(board, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
//	@DeleteMapping("/api/board/{id}")
//	public ResponseDto<Integer> deleteById(@PathVariable int id){
//		boardService.글삭제(id);
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}
//	
//	@PutMapping("/api/board/{id}")
//	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Board board){
//		boardService.글수정(id, board);
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}
//	
//	// 데이터 받을 대 컨트롤러에서 dto를 만들어서 받는게 좋다.
//	// dto 사용하지 않은 이유 => 
//	@PostMapping("/api/board/{boardId}/reply")
////	public ResponseDto<Integer> replySave(@PathVariable int boardId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalDetail principal) {
//	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {	
//		boardService.댓글쓰기(replySaveRequestDto);
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}
//	
//	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
//	public ResponseDto<Integer> replyDelete(@PathVariable int replyId) {
//		boardService.댓글삭제(replyId);
//		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
//	}
	
}