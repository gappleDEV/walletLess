package com.walletless.api.services;

import com.walletless.api.dao.ProviderRepository;
import com.walletless.api.models.Provider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("providerService")
public class ProviderService implements IProviderService{

    @Autowired
    private ProviderRepository providerRepository;

    public Provider createNewProvider(String email, String upw) {
        if (providerRepository.findByEmail(email) == null){
            return providerRepository.save(new Provider(email, upw.hashCode()));
        }
        return null;
    }

    public Provider authenticate(String email, String ppw) {
        Provider Provider = providerRepository.findByEmail(email);
        if(Provider != null && Provider.getPpw() == ppw.hashCode())
            return Provider;
        return null;
    }
}
