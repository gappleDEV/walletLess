package com.walletless.api.dao;

import org.springframework.data.repository.CrudRepository;
import com.walletless.api.models.User;

public interface UserRepository extends CrudRepository<User, Integer>{
    User findByEmail(String email);
}
