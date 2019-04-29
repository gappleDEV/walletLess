package com.walletless.api.services;

import com.walletless.api.dao.PersonalInformationRepository;
import com.walletless.api.dao.RequestRepository;
import com.walletless.api.dao.UserRepository;
import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.Provider;
import com.walletless.api.models.Request;
import com.walletless.api.models.User;
import com.walletless.api.vo.PersonalInformationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("personalInformationService")
public class PersonalInformationService implements IPersonalInformationService {

    @Autowired
    private PersonalInformationRepository personalInformationRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IUserService userService;
    @Autowired
    private IProviderService providerService;
    @Autowired
    private RequestRepository requestRepository;

    public PersonalInformation createNewPersonalInformation(PersonalInformationVO personalInformationVO) {
        User user = userRepository.findByEmail(personalInformationVO.userEmail);

        if(personalInformationRepository.findByUser_Email(personalInformationVO.userEmail) == null) {
            System.out.println("NO, i am here");
            return personalInformationRepository.save(new PersonalInformation(personalInformationVO, user));
        } else { return null; }
    }

    public PersonalInformation getPersonalInformationAsUser(String email, String upw) {
        User user = userService.authenticate(email, upw);
        if (user != null) {
            return personalInformationRepository.findByUser_Email(email);
        }
        return null;
    }

    public PersonalInformation getPersonalInformationAsProvider(String userEmail, String providerEmail, String ppw) {
        Provider provider = providerService.authenticate(providerEmail, ppw);
        User user = userRepository.findByEmail(userEmail);

        if (provider != null && user != null) {
            Request request = requestRepository.findByUserInAndProviderIn(user, provider);

            if (request != null && !request.isExpired() && request.isApproved()) {
                return personalInformationRepository.findByUser_Email(userEmail);
            }
        }
        return null;
    }
}
