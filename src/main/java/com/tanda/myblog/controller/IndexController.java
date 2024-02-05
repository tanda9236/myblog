package com.tanda.myblog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tanda.myblog.service.BoardService;
import com.tanda.myblog.service.UserService;


@Controller
public class IndexController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping({"","/"})
	public String index(HttpServletRequest request, Model model, @PageableDefault(size=5, sort="id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards",boardService.글목록(pageable));
		int pageBlock = 5;
		int currentPage = boardService.글목록(pageable).getNumber();
		int startPage=currentPage/pageBlock*pageBlock;
		int endPage = startPage + pageBlock - 1;
		int pageCount = boardService.글목록(pageable).getTotalPages() - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}		
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "index";
	}// 메인 페이지
	
	
//	테스트 페이지
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
	
	@GetMapping("testSearch")
	public String testSearch(Model model) {
		model.addAttribute("users",userService.유저목록());
		return "testSearch";
	}
	
}
