package com.walletless.api.vo;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.Provider;

public class ProviderPIRequestVO {
    public String userEmail;
    public Provider provider;

    ProviderPIRequestVO() {}

    ProviderPIRequestVO(String email, Provider provider) {
        this.userEmail = email;
        this.provider = provider;
    }
}
