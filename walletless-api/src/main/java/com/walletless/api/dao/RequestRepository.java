package com.walletless.api.dao;

import com.walletless.api.models.Provider;
import com.walletless.api.models.Request;
import com.walletless.api.models.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RequestRepository extends CrudRepository<Request, Integer> {
    List<Request> findAllByUser(User user);
    List<Request> findAllByProvider(Provider provider);
    Request findByUserInAndProviderIn(User user, Provider provider);
}
