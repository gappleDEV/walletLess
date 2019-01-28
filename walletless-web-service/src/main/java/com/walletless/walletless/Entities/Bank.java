package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "bank")
public class Bank extends AuditModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bank_id")
    private int bankId;

    @Column(name = "checking_acct_num")
    private String checkingAccountNum;

    @Column(name = "checking_account_micr_num")
    private String checkingAccountMICRNum;

    @Column(name = "checking_acct_bal")
    private String checkingAccountBalance;

    @Column(name = "checking_acct_statement")
    private String checkingAccountStatement;

    @Column(name = "savings_acct_num")
    private String savingsAccountNum;

    @Column(name = "savings_acct_bal")
    private String savingsAccountBalance;

    @Column(name = "savings_acct_statement")
    private String savingsAccountStatement;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getBankId() {
        return bankId;
    }

    public void setBankId(int bankId) {
        this.bankId = bankId;
    }

    public String getCheckingAccountNum() {
        return checkingAccountNum;
    }

    public void setCheckingAccountNum(String checkingAccountNum) {
        this.checkingAccountNum = checkingAccountNum;
    }

    public String getCheckingAccountMICRNum() {
        return checkingAccountMICRNum;
    }

    public void setCheckingAccountMICRNum(String checkingAccountMICRNum) {
        this.checkingAccountMICRNum = checkingAccountMICRNum;
    }

    public String getCheckingAccountBalance() {
        return checkingAccountBalance;
    }

    public void setCheckingAccountBalance(String checkingAccountBalance) {
        this.checkingAccountBalance = checkingAccountBalance;
    }

    public String getCheckingAccountStatement() {
        return checkingAccountStatement;
    }

    public void setCheckingAccountStatement(String checkingAccountStatement) {
        this.checkingAccountStatement = checkingAccountStatement;
    }

    public String getSavingsAccountNum() {
        return savingsAccountNum;
    }

    public void setSavingsAccountNum(String savingsAccountNum) {
        this.savingsAccountNum = savingsAccountNum;
    }

    public String getSavingsAccountBalance() {
        return savingsAccountBalance;
    }

    public void setSavingsAccountBalance(String savingsAccountBalance) {
        this.savingsAccountBalance = savingsAccountBalance;
    }

    public String getSavingsAccountStatement() {
        return savingsAccountStatement;
    }

    public void setSavingsAccountStatement(String savingsAccountStatement) {
        this.savingsAccountStatement = savingsAccountStatement;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
