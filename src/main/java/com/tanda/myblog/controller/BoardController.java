package com.tanda.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/blogWrite")
	public String blogWrite() {
		return "/board/blogWrite";
	}

}
