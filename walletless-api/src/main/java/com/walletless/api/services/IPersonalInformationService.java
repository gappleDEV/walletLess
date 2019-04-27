package com.walletless.api.services;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.Provider;
import com.walletless.api.models.User;
import com.walletless.api.vo.PersonalInformationVO;

public interface IPersonalInformationService {
    PersonalInformation createNewPersonalInformation(PersonalInformationVO pi);
    PersonalInformation userGetPersonalInformation(User user);
    PersonalInformation providerGetPersonalInformation(Provider provider, String userEmail);
}
