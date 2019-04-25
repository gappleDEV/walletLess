package com.walletless.api.services;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.vo.PersonalInformationVO;

public interface IPersonalInformationService {
    PersonalInformation createNewPersonalInformation(PersonalInformationVO pi);
}
