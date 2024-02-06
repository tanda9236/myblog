package com.tanda.myblog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tanda.myblog.model.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Integer>{
	
}