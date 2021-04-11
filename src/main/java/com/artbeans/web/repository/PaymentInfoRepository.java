package com.artbeans.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.artbeans.web.entity.PaymentInfo;

public interface PaymentInfoRepository extends JpaRepository<PaymentInfo, Integer> {

}
