package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "health_insurance")
public class HealthInsurance extends AuditModel{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "health_insurance_id")
    private Integer healthInsuranceId;

    @Column(name = "healthcare_insurance")
    private String healthcareInsurance; //primary, secondary, tertiary

    @Column(name = "name")
    private String healthcareCompanyName;

    @Column(name = "address")
    private String healthcareCompanyAddress;

    @Column(name = "phone")
    private String healthcareCompanyPhone;

    @Column(name = "subscriber_id")
    private String healthcareCompanySubscriberID;

    @Column(name = "group_id")
    private String healthcareCompanyGroupID;

    @Column(name = "claim_address")
    private String healthcareCompanyClaimAddress;

    @Column(name = "card_front")
    private String healthcareCompanyCardFront;

    @Column(name = "card_back")
    private String healthcareCompanyCardBack;

    @Column(name = "effective_date")
    private Date healthcareCompanyEffectiveDate;

    @Column(name = "claim_number")
    private String healthcareCompanyClaimNumber;

    @Column(name = "date_of_service")
    private Date healthcareCompanyClaimDateOfService;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getHealthInsuranceId() {
        return healthInsuranceId;
    }

    public void setHealthInsuranceId(int healthInsuranceId) {
        this.healthInsuranceId = healthInsuranceId;
    }

    public String getHealthcareInsurance() {
        return healthcareInsurance;
    }

    public void setHealthcareInsurance(String healthcareInsurance) {
        this.healthcareInsurance = healthcareInsurance;
    }

    public String getHealthcareCompanyName() {
        return healthcareCompanyName;
    }

    public void setHealthcareCompanyName(String healthcareCompanyName) {
        this.healthcareCompanyName = healthcareCompanyName;
    }

    public String getHealthcareCompanyAddress() {
        return healthcareCompanyAddress;
    }

    public void setHealthcareCompanyAddress(String healthcareCompanyAddress) {
        this.healthcareCompanyAddress = healthcareCompanyAddress;
    }

    public String getHealthcareCompanyPhone() {
        return healthcareCompanyPhone;
    }

    public void setHealthcareCompanyPhone(String healthcareCompanyPhone) {
        this.healthcareCompanyPhone = healthcareCompanyPhone;
    }

    public String getHealthcareCompanySubscriberID() {
        return healthcareCompanySubscriberID;
    }

    public void setHealthcareCompanySubscriberID(String healthcareCompanySubscriberID) {
        this.healthcareCompanySubscriberID = healthcareCompanySubscriberID;
    }

    public String getHealthcareCompanyGroupID() {
        return healthcareCompanyGroupID;
    }

    public void setHealthcareCompanyGroupID(String healthcareCompanyGroupID) {
        this.healthcareCompanyGroupID = healthcareCompanyGroupID;
    }

    public String getHealthcareCompanyClaimAddress() {
        return healthcareCompanyClaimAddress;
    }

    public void setHealthcareCompanyClaimAddress(String healthcareCompanyClaimAddress) {
        this.healthcareCompanyClaimAddress = healthcareCompanyClaimAddress;
    }

    public String getHealthcareCompanyCardFront() {
        return healthcareCompanyCardFront;
    }

    public void setHealthcareCompanyCardFront(String healthcareCompanyCardFront) {
        this.healthcareCompanyCardFront = healthcareCompanyCardFront;
    }

    public String getHealthcareCompanyCardBack() {
        return healthcareCompanyCardBack;
    }

    public void setHealthcareCompanyCardBack(String healthcareCompanyCardBack) {
        this.healthcareCompanyCardBack = healthcareCompanyCardBack;
    }

    public Date getHealthcareCompanyEffectiveDate() {
        return healthcareCompanyEffectiveDate;
    }

    public void setHealthcareCompanyEffectiveDate(Date healthcareCompanyEffectiveDate) {
        this.healthcareCompanyEffectiveDate = healthcareCompanyEffectiveDate;
    }

    public String getHealthcareCompanyClaimNumber() {
        return healthcareCompanyClaimNumber;
    }

    public void setHealthcareCompanyClaimNumber(String healthcareCompanyClaimNumber) {
        this.healthcareCompanyClaimNumber = healthcareCompanyClaimNumber;
    }

    public Date getHealthcareCompanyClaimDateOfService() {
        return healthcareCompanyClaimDateOfService;
    }

    public void setHealthcareCompanyClaimDateOfService(Date healthcareCompanyClaimDateOfService) {
        this.healthcareCompanyClaimDateOfService = healthcareCompanyClaimDateOfService;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
