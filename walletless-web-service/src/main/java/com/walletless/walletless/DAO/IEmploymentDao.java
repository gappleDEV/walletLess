package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.Employment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IEmploymentDao extends JpaRepository<Employment, Integer> {
}