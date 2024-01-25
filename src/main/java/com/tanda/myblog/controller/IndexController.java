package com.tanda.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {

	@GetMapping({"","/"})
	public String index() {
		return "index";
	}
	
//	테스트 페이지
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
}
