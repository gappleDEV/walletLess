package com.walletless.api.services;

import com.walletless.api.models.Provider;

public interface IProviderService {
    Provider createNewProvider(String email, String ppw);
    Provider authenticate(String email, String ppw);
}
