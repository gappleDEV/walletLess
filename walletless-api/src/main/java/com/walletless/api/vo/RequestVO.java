package com.walletless.api.vo;

import com.walletless.api.models.Provider;
import com.walletless.api.models.User;

public class RequestVO {
    public String message;
    public String userEmail;
    public String providerEmail;

    public RequestVO() {}

    public RequestVO(String message, String user, String provider){
        this.message = message;
        this.userEmail = user;
        this.providerEmail = provider;
    }
}
