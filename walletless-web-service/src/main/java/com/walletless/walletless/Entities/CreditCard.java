package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "credit_cards")
public class CreditCard extends  AuditModel{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "credit_card_id")
    private Integer creditCardId;

    @Column(name = "credit_card_type")
    private String creditCardType;

    @Column(name = "name_on_card")
    private String nameOnCard;

    @Column(name = "card_number")
    private String creditCardNum;

    @Column(name = "expriation_date")
    private String creditCardExpireDate;

    @Column(name = "security_code")
    private String creditCardSecurityCode;

    @Column(name = "current_balance")
    private String creditCardCurrentBalance;

    @Column(name = "credit_available")
    private String creditCardCreditAvailable;

    @Column(name = "reward_points")
    private String creditCardRewardPoints;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(int creditCardId) {
        this.creditCardId = creditCardId;
    }

    public String getCreditCardType() {
        return creditCardType;
    }

    public void setCreditCardType(String creditCardType) {
        this.creditCardType = creditCardType;
    }

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public String getCreditCardNum() {
        return creditCardNum;
    }

    public void setCreditCardNum(String creditCardNum) {
        this.creditCardNum = creditCardNum;
    }

    public String getCreditCardExpireDate() {
        return creditCardExpireDate;
    }

    public void setCreditCardExpireDate(String creditCardExpireDate) {
        this.creditCardExpireDate = creditCardExpireDate;
    }

    public String getCreditCardSecurityCode() {
        return creditCardSecurityCode;
    }

    public void setCreditCardSecurityCode(String creditCardSecurityCode) {
        this.creditCardSecurityCode = creditCardSecurityCode;
    }

    public String getCreditCardCurrentBalance() {
        return creditCardCurrentBalance;
    }

    public void setCreditCardCurrentBalance(String creditCardCurrentBalance) {
        this.creditCardCurrentBalance = creditCardCurrentBalance;
    }

    public String getCreditCardCreditAvailable() {
        return creditCardCreditAvailable;
    }

    public void setCreditCardCreditAvailable(String creditCardCreditAvailable) {
        this.creditCardCreditAvailable = creditCardCreditAvailable;
    }

    public String getCreditCardRewardPoints() {
        return creditCardRewardPoints;
    }

    public void setCreditCardRewardPoints(String creditCardRewardPoints) {
        this.creditCardRewardPoints = creditCardRewardPoints;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
