package com.tanda.myblog.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.tanda.myblog.model.Payment;
import com.tanda.myblog.model.User;
import com.tanda.myblog.repository.PaymentRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaymentService {

	private final PaymentRepository paymentRepository;
	
	@Transactional
	public void 블로그후원(Payment payment, User user) {
		payment.setUser(user);
		payment.setProductName(payment.getProductName());
		payment.setAmount(payment.getAmount());
		payment.setPayMethod(payment.getPayMethod());
		payment.setMerchantUid(payment.getMerchantUid());
		paymentRepository.save(payment);
	}// 결제정보 저장
}
