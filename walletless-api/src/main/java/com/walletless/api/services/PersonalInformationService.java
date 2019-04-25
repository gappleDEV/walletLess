package com.walletless.api.services;

import com.walletless.api.dao.PersonalInformationRepository;
import com.walletless.api.dao.UserRepository;
import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.User;
import com.walletless.api.vo.PersonalInformationVO;
import org.springframework.beans.factory.annotation.Autowired;

public class PersonalInformationService implements IPersonalInformationService {

    @Autowired
    private PersonalInformationRepository personalInformationRepository;
    @Autowired
    private UserRepository userRepository;

    public PersonalInformation createNewPersonalInformation(PersonalInformationVO personalInformationVO) {
        if(userRepository.findByEmail(personalInformationVO.user.getEmail()) == null) {
            //cannot create personal information if user does not exist
            //todo should probably create my own exception but not worried about that right now
            return null;
        } else if(personalInformationRepository.findByUser(personalInformationVO.user) == null) {
            return personalInformationRepository.save(new PersonalInformation(personalInformationVO));
        } else { return null; }
    }
}
