package com.walletless.api.controllers;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.User;
import com.walletless.api.services.IPersonalInformationService;
import com.walletless.api.vo.PersonalInformationVO;
import com.walletless.api.vo.ProviderPIRequestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/pi")
public class PersonalInformationController {

    @Autowired
    private IPersonalInformationService personalInformationService;

    @PostMapping(path="/add")
    @ResponseBody
    public PersonalInformation addPersonalInformation(@RequestBody PersonalInformationVO personalInformationVO) {
        return personalInformationService.createNewPersonalInformation(personalInformationVO);
    }

    @PostMapping(path="/userGet")
    @ResponseBody
    public PersonalInformation userGetPoersonalInformation(@RequestBody User user){
        return personalInformationService.userGetPersonalInformation(user);
    }

    @PostMapping(path="/providerGet")
    @ResponseBody
    public PersonalInformation providerGetPersonalInformation(ProviderPIRequestVO piRequestVO){
        return personalInformationService.providerGetPersonalInformation(piRequestVO.provider, piRequestVO.userEmail);
    }
}
