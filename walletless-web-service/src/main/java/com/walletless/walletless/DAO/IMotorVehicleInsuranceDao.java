package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.MotorVehicleInsurance;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IMotorVehicleInsuranceDao extends JpaRepository<MotorVehicleInsurance, Integer> {
}