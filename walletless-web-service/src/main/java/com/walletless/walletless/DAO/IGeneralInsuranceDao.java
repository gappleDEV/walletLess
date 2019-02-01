package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.GeneralInsurance;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IGeneralInsuranceDao extends JpaRepository<GeneralInsurance, Integer> {
}