package com.tanda.myblog.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.tanda.myblog.config.auth.PrincipalDetails;
import com.tanda.myblog.dto.ResponseDto;
import com.tanda.myblog.model.Payment;
import com.tanda.myblog.service.PaymentService;

@RestController
public class PaymentApiController {

	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/blogDonate")
	public ResponseDto<Integer> save(@RequestBody Payment payment, @AuthenticationPrincipal PrincipalDetails principal) { 
		System.out.println("UserApiController : save 호출");
		paymentService.블로그후원(payment, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}// 결제내역 저장
}
