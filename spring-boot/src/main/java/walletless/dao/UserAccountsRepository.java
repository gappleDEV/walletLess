package walletless;

import org.springframework.data.repository.CrudRepository;

import walletless.UserAccounts;

//this should be auto implemented by spring into bean called userAccountsRepository

public interface UserAccountsRepository extends CrudRepository<UserAccounts, Long>{
    
}