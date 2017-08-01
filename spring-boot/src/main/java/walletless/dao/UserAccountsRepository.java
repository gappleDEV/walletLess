package walletless.dao;

import org.springframework.data.repository.CrudRepository;

import walletless.domain.UserAccounts;

//this should be auto implemented by spring into bean called userAccountsRepository

public interface UserAccountsRepository extends CrudRepository<UserAccounts, Long>{
    
}