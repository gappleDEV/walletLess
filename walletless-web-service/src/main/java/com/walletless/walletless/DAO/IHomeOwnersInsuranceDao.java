package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.HomeOwnersInsurance;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IHomeOwnersInsuranceDao extends JpaRepository<HomeOwnersInsurance, Integer> {
}