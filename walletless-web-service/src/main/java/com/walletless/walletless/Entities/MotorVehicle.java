package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "motor_vehicle")
public class MotorVehicle extends AuditModel{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vehicle_id")
    private int vehicleId;

    @Column(name = "license")
    private String motorVehicleLicense;

    @Column(name = "registration")
    private String motorVehicleRegistrationOne;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getVehicleid() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public String getMotorVehicleLicense() {
        return motorVehicleLicense;
    }

    public void setMotorVehicleLicense(String motorVehicleLicense) {
        this.motorVehicleLicense = motorVehicleLicense;
    }

    public String getMotorVehicleRegistrationOne() {
        return motorVehicleRegistrationOne;
    }

    public void setMotorVehicleRegistrationOne(String motorVehicleRegistrationOne) {
        this.motorVehicleRegistrationOne = motorVehicleRegistrationOne;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
