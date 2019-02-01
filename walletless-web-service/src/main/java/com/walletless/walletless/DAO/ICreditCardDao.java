package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.CreditCard;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ICreditCardDao extends JpaRepository<CreditCard, Integer> {
}
