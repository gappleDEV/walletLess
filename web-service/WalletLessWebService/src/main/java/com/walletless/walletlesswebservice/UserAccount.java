package com.walletless.walletlesswebservice;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.validation.constraints.NotBlank;
import java.util.Date;

public class UserAccount {
    private final String id;
    private final String username;
    private final String password;
    private final int acctType;
    private final LocalDateTime createDate;
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
