package com.tanda.myblog.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
//
//	private final IamportClient iamportClient;
//
//	public PaymentController() {
//		this.iamportClient = new IamportClient(
//				"7861462864255884", 
//				"FQxz9FecO0pj3L1Fz27EuSrwxHvUIBZlezrKmsu6ParCZayUHm6q7xPf1ySWWkrVJFyBXA20tKMv7VTX");
//	}
//
//	@PostMapping("/verify/{imp_uid}")
//	public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
//			throws IamportResponseException, IOException {
//		return iamportClient.paymentByImpUid(imp_uid);
//	}// 결제 검증
}
