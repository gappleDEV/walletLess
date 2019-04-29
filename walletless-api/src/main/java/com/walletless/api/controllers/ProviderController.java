package com.walletless.api.controllers;

import com.walletless.api.models.Provider;
import com.walletless.api.services.IProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping(path="/provider")
public class ProviderController {

    @Autowired
    private IProviderService providerService;

    @GetMapping(path="/create")
    @ResponseBody
    public Provider createProvider(@RequestParam String email, @RequestParam String ppw, @RequestParam String provName, @RequestParam String provUserName) {
        return providerService.createNewProvider(email, ppw, provName, provUserName);
    }

    @GetMapping(path="/authenticate")
    @ResponseBody
    public Provider authenticateProvider(@RequestParam String email, @RequestParam String ppw) {
        return providerService.authenticate(email, ppw);
    }
}
