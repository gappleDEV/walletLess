package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "general_insurance")
public class GeneralInsurance extends AuditModel{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "general_insurance_id")
    private int generalInsuranceId;

    @Column(name = "general_insurance")
    private String generalInsurance ;//primary, secondary, tertiary

    @Column(name = "name")
    private String generalCompanyName;

    @Column(name = "address")
    private String generalCompanyAddress;

    @Column(name = "phone")
    private String generalCompanyPhone;

    @Column(name = "card_front")
    private String generalCompanyCardFront;

    @Column(name = "card_back")
    private String generalCompanyCardBack;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getGeneralInsuranceId() {
        return generalInsuranceId;
    }

    public void setGeneralInsuranceId(int generalInsuranceId) {
        this.generalInsuranceId = generalInsuranceId;
    }

    public String getGeneralInsurance() {
        return generalInsurance;
    }

    public void setGeneralInsurance(String generalInsurance) {
        this.generalInsurance = generalInsurance;
    }

    public String getGeneralCompanyName() {
        return generalCompanyName;
    }

    public void setGeneralCompanyName(String generalCompanyName) {
        this.generalCompanyName = generalCompanyName;
    }

    public String getGeneralCompanyAddress() {
        return generalCompanyAddress;
    }

    public void setGeneralCompanyAddress(String generalCompanyAddress) {
        this.generalCompanyAddress = generalCompanyAddress;
    }

    public String getGeneralCompanyPhone() {
        return generalCompanyPhone;
    }

    public void setGeneralCompanyPhone(String generalCompanyPhone) {
        this.generalCompanyPhone = generalCompanyPhone;
    }

    public String getGeneralCompanyCardFront() {
        return generalCompanyCardFront;
    }

    public void setGeneralCompanyCardFront(String generalCompanyCardFront) {
        this.generalCompanyCardFront = generalCompanyCardFront;
    }

    public String getGeneralCompanyCardBack() {
        return generalCompanyCardBack;
    }

    public void setGeneralCompanyCardBack(String generalCompanyCardBack) {
        this.generalCompanyCardBack = generalCompanyCardBack;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
