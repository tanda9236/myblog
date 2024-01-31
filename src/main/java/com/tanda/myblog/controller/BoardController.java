package com.tanda.myblog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.tanda.myblog.model.Board;
import com.tanda.myblog.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board/blogWrite")
	public String blogWrite() {
		return "/board/blogWrite";
	}// 글작성 페이지
	
	@GetMapping("/{id}")
	public String blogWrite(@PathVariable int id, HttpServletRequest request, Model model,
							@PageableDefault(size=2, sort="id", direction = Sort.Direction.DESC) Pageable pageable) {
		Page<Board> userBoards = boardService.유저별글목록(id, pageable);
	    model.addAttribute("boards", userBoards);
	    
	    int pageBlock = 5;
		int currentPage = boardService.유저별글목록(id, pageable).getNumber();
		int startPage=currentPage/pageBlock*pageBlock;
		int endPage = startPage + pageBlock - 1;
		int pageCount = boardService.유저별글목록(id, pageable).getTotalPages() - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}		
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "/board/userBlog";
	}// 유저별 블로그 페이지
	
	@GetMapping("/{userId}/board/{id}")
	public String findByUserIdAndId(@PathVariable int userId, @PathVariable int id, Model model) {
		
	    model.addAttribute("board", boardService.글상세보기(userId, id));
	    return "/board/blogDetails";
	}// 게시글 상세보기 페이지
	
	@GetMapping("/board/{id}/blogUpdate")
	public String blogUpdate(@PathVariable int id, Model model) {
		
	    model.addAttribute("board", boardService.글상세보기(id));
	    return "/board/blogUpdate";
	}// 게시글 수정 페이지
	
}
