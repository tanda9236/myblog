package com.tanda.myblog.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Payment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String merchantUid;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "payerId")
    private User user;
	
	private String productName;

	private String payMethod;
	
	private int amount;
	
	@CreationTimestamp
	private Timestamp paymentDate;
	
//	private Timestamp expirationDate;
	
}
