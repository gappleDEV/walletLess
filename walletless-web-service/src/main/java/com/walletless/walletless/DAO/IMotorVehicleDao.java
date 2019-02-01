package com.walletless.walletless.DAO;

import com.walletless.walletless.Entities.Bank;
import com.walletless.walletless.Entities.MotorVehicle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IMotorVehicleDao extends JpaRepository<MotorVehicle, Integer> {
}