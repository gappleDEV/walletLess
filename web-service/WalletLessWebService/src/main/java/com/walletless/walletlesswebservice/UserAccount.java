package com.walletless.walletlesswebservice;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Table(name = "Users")
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"createdAt", "updatedAt",}, allowGetters = true)
public class UserAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private final String id;

    @NotBlank
    private final String username;

    @NotBlank
    private final String password;

    @NotBlank
    private final int acctType;

    @NotBlank
    private final LocalDateTime createDate;

    @NotBlank
    private final int isActive;

    public UserAccount(String id, String username, String password, int acctType, int isActive){
        this.id = id;
        this.username = username;
        this.password = password;
        this.acctType = acctType;
        this.createDate = LocalDateTime.now();
        this.isActive = isActive;
    }

    public String getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getAcctType() {
        return acctType;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public int getIsActive() {
        return isActive;
    }
}
