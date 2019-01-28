package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "vehicle_insurance")
public class MotorVehicleInsurance extends AuditModel{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vehicle_insurance_id")
    private int vehicleInsuranceId;

    @Column(name = "vehicle_insurance")
    private String motorVehicleInsurance; //primary, secondary, tertiary

    @Column(name = "name")
    private String motorVehicleCompanyName;

    @Column(name = "address")
    private String motorVehicleCompanyAddress;

    @Column(name = "phone")
    private String motorVehicleCompanyPhone;

    @Column(name = "id_num")
    private String motorVehicleCompanyIdentificationNum;

    @Column(name = "claim_name")
    private String motorVehicleCompanyClaimNum;

    @Column(name = "accident_date")
    private Date motorVehicleCompanyAccidentDate;

    @Column(name = "effective_date")
    private Date motorVehicleCompanyEffectiveDate;

    @Column(name = "limits_of_liability")
    private String motorVehicleCompanyLimitsOfLiability;

    @Column(name = "limits_of_pip")
    private String motorVehicleCompanyLimitsOfPIP;

    @Column(name = "pip_docs_to_complete")
    private String motorVehicleCompanyPIPDocsToComplete;

    @Column(name = "company_primary")
    private String motorVehicleCompanyPrimary; //auto or health

    @Column(name = "card_front")
    private String motorVehicleCompanyCardFront;

    @Column(name = "card_back")
    private String motorVehicleCompanyCardBack;

    @Column(name = "investigation_info")
    private String motorVehicleCompanyInvestigationInfo;

    @Column(name = "status_of_claim")
    private String motorVehicleCompanyStatusOfClaim;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getVehicleInsuranceId() {
        return vehicleInsuranceId;
    }

    public void setVehicleInsuranceId(int vehicleInsuranceId) {
        this.vehicleInsuranceId = vehicleInsuranceId;
    }

    public String getMotorVehicleInsurance() {
        return motorVehicleInsurance;
    }

    public void setMotorVehicleInsurance(String motorVehicleInsurance) {
        this.motorVehicleInsurance = motorVehicleInsurance;
    }

    public String getMotorVehicleCompanyName() {
        return motorVehicleCompanyName;
    }

    public void setMotorVehicleCompanyName(String motorVehicleCompanyName) {
        this.motorVehicleCompanyName = motorVehicleCompanyName;
    }

    public String getMotorVehicleCompanyAddress() {
        return motorVehicleCompanyAddress;
    }

    public void setMotorVehicleCompanyAddress(String motorVehicleCompanyAddress) {
        this.motorVehicleCompanyAddress = motorVehicleCompanyAddress;
    }

    public String getMotorVehicleCompanyPhone() {
        return motorVehicleCompanyPhone;
    }

    public void setMotorVehicleCompanyPhone(String motorVehicleCompanyPhone) {
        this.motorVehicleCompanyPhone = motorVehicleCompanyPhone;
    }

    public String getMotorVehicleCompanyIdentificationNum() {
        return motorVehicleCompanyIdentificationNum;
    }

    public void setMotorVehicleCompanyIdentificationNum(String motorVehicleCompanyIdentificationNum) {
        this.motorVehicleCompanyIdentificationNum = motorVehicleCompanyIdentificationNum;
    }

    public String getMotorVehicleCompanyClaimNum() {
        return motorVehicleCompanyClaimNum;
    }

    public void setMotorVehicleCompanyClaimNum(String motorVehicleCompanyClaimNum) {
        this.motorVehicleCompanyClaimNum = motorVehicleCompanyClaimNum;
    }

    public Date getMotorVehicleCompanyAccidentDate() {
        return motorVehicleCompanyAccidentDate;
    }

    public void setMotorVehicleCompanyAccidentDate(Date motorVehicleCompanyAccidentDate) {
        this.motorVehicleCompanyAccidentDate = motorVehicleCompanyAccidentDate;
    }

    public Date getMotorVehicleCompanyEffectiveDate() {
        return motorVehicleCompanyEffectiveDate;
    }

    public void setMotorVehicleCompanyEffectiveDate(Date motorVehicleCompanyEffectiveDate) {
        this.motorVehicleCompanyEffectiveDate = motorVehicleCompanyEffectiveDate;
    }

    public String getMotorVehicleCompanyLimitsOfLiability() {
        return motorVehicleCompanyLimitsOfLiability;
    }

    public void setMotorVehicleCompanyLimitsOfLiability(String motorVehicleCompanyLimitsOfLiability) {
        this.motorVehicleCompanyLimitsOfLiability = motorVehicleCompanyLimitsOfLiability;
    }

    public String getMotorVehicleCompanyLimitsOfPIP() {
        return motorVehicleCompanyLimitsOfPIP;
    }

    public void setMotorVehicleCompanyLimitsOfPIP(String motorVehicleCompanyLimitsOfPIP) {
        this.motorVehicleCompanyLimitsOfPIP = motorVehicleCompanyLimitsOfPIP;
    }

    public String getMotorVehicleCompanyPIPDocsToComplete() {
        return motorVehicleCompanyPIPDocsToComplete;
    }

    public void setMotorVehicleCompanyPIPDocsToComplete(String motorVehicleCompanyPIPDocsToComplete) {
        this.motorVehicleCompanyPIPDocsToComplete = motorVehicleCompanyPIPDocsToComplete;
    }

    public String getMotorVehicleCompanyPrimary() {
        return motorVehicleCompanyPrimary;
    }

    public void setMotorVehicleCompanyPrimary(String motorVehicleCompanyPrimary) {
        this.motorVehicleCompanyPrimary = motorVehicleCompanyPrimary;
    }

    public String getMotorVehicleCompanyCardFront() {
        return motorVehicleCompanyCardFront;
    }

    public void setMotorVehicleCompanyCardFront(String motorVehicleCompanyCardFront) {
        this.motorVehicleCompanyCardFront = motorVehicleCompanyCardFront;
    }

    public String getMotorVehicleCompanyCardBack() {
        return motorVehicleCompanyCardBack;
    }

    public void setMotorVehicleCompanyCardBack(String motorVehicleCompanyCardBack) {
        this.motorVehicleCompanyCardBack = motorVehicleCompanyCardBack;
    }

    public String getMotorVehicleCompanyInvestigationInfo() {
        return motorVehicleCompanyInvestigationInfo;
    }

    public void setMotorVehicleCompanyInvestigationInfo(String motorVehicleCompanyInvestigationInfo) {
        this.motorVehicleCompanyInvestigationInfo = motorVehicleCompanyInvestigationInfo;
    }

    public String getMotorVehicleCompanyStatusOfClaim() {
        return motorVehicleCompanyStatusOfClaim;
    }

    public void setMotorVehicleCompanyStatusOfClaim(String motorVehicleCompanyStatusOfClaim) {
        this.motorVehicleCompanyStatusOfClaim = motorVehicleCompanyStatusOfClaim;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
