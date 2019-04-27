package com.walletless.api.vo;

import com.walletless.api.models.Provider;
import com.walletless.api.models.User;

public class RequestVO {
    public String message;
    public User user;
    public Provider provider;

    public RequestVO() {}

    public RequestVO(String message, User user, Provider provider){
        this.message = message;
        this.user = user;
        this.provider = provider;
    }
}
