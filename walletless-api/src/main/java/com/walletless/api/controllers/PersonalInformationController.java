package com.walletless.api.controllers;

import com.walletless.api.models.PersonalInformation;
import com.walletless.api.models.User;
import com.walletless.api.services.IPersonalInformationService;
import com.walletless.api.vo.PersonalInformationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/pi")
public class PersonalInformationController {

    @Autowired
    private IPersonalInformationService personalInformationService;

    @PostMapping(path="add")
    public @ResponseBody PersonalInformation addPersonalInformation(@RequestBody PersonalInformationVO personalInformationVO) {
        return personalInformationService.createNewPersonalInformation(personalInformationVO);
    }
}
