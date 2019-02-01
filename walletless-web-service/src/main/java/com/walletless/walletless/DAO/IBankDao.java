package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IBankDao extends JpaRepository<Bank, Integer> {
}
