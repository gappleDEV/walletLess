package com.walletless.api.dao;

import com.walletless.api.models.Provider;
import org.springframework.data.repository.CrudRepository;

public interface ProviderRepository  extends CrudRepository<Provider, Integer> {
    Provider findByEmail(String email);
}
