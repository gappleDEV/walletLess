package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.PersonalInformation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IPersonalInformationDao extends JpaRepository<PersonalInformation, Integer> {
}