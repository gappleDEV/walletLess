package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "homeowners_insurance")
public class HomeOwnersInsurance extends AuditModel{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "homeowners_insurance_id")
    private Integer homeOwnersInsuranceId;

    @Column(name = "homeowners_insurance")
    private String homeownersInsurance; //primary, secondary, tertiary

    @Column(name = "name")
    private String homeownersCompanyName;

    @Column(name = "address")
    private String homeownersCompanyAddress;

    @Column(name = "phone")
    private String homeownersCompanyPhone;

    @Column(name = "claim_submissions")
    private String homeownersClaimSubmission;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getHomeOwnersInsuranceId() {
        return homeOwnersInsuranceId;
    }

    public void setHomeOwnersInsuranceId(int homeOwnersInsuranceId) {
        this.homeOwnersInsuranceId = homeOwnersInsuranceId;
    }

    public String getHomeownersInsurance() {
        return homeownersInsurance;
    }

    public void setHomeownersInsurance(String homeownersInsurance) {
        this.homeownersInsurance = homeownersInsurance;
    }

    public String getHomeownersCompanyName() {
        return homeownersCompanyName;
    }

    public void setHomeownersCompanyName(String homeownersCompanyName) {
        this.homeownersCompanyName = homeownersCompanyName;
    }

    public String getHomeownersCompanyAddress() {
        return homeownersCompanyAddress;
    }

    public void setHomeownersCompanyAddress(String homeownersCompanyAddress) {
        this.homeownersCompanyAddress = homeownersCompanyAddress;
    }

    public String getHomeownersCompanyPhone() {
        return homeownersCompanyPhone;
    }

    public void setHomeownersCompanyPhone(String homeownersCompanyPhone) {
        this.homeownersCompanyPhone = homeownersCompanyPhone;
    }

    public String getHomeownersClaimSubmission() {
        return homeownersClaimSubmission;
    }

    public void setHomeownersClaimSubmission(String homeownersClaimSubmission) {
        this.homeownersClaimSubmission = homeownersClaimSubmission;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
