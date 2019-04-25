package com.walletless.api.dao;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.User;
import org.springframework.data.repository.CrudRepository;

public interface PersonalInformationRepository extends CrudRepository<PersonalInformation, Integer> {
    PersonalInformation findByUser(User user);
}
