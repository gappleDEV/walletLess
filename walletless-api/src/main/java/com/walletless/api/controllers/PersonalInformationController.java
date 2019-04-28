package com.walletless.api.controllers;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.services.IPersonalInformationService;
import com.walletless.api.vo.PersonalInformationVO;
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

    @GetMapping(path="/userGet")
    @ResponseBody
    public PersonalInformation userGetPersonalInformation(@RequestParam String email, @RequestParam String upw){
        PersonalInformation pi = personalInformationService.getPersonalInformationAsUser(email, upw);
        return pi;
    }

    @PostMapping(path="/providerGet")
    @ResponseBody
    public PersonalInformation providerGetPersonalInformation(@RequestParam String userEmail, @RequestParam String providerEmail, @RequestParam String ppw){
        return personalInformationService.getPersonalInformationAsProvider(userEmail, providerEmail, ppw);
    }
}
