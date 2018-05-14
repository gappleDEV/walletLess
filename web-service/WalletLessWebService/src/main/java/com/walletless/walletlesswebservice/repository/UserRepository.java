package com.walletless.walletlesswebservice.repository;

import com.walletless.walletlesswebservice.model.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserAccount, Long> {

}
