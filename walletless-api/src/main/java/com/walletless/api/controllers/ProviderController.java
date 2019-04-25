package com.walletless.api.controllers;

import com.walletless.api.models.Provider;
import com.walletless.api.services.IProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/provider")
public class ProviderController {

    @Autowired
    private IProviderService providerService;

    @GetMapping(path="/create")
    public @ResponseBody
    Provider createProvider(@RequestParam String email, @RequestParam String ppw) {
        return providerService.createNewProvider(email, ppw);
    }

    @GetMapping(path="/authenticate")
    public @ResponseBody Provider authenticateProvider(@RequestParam String email, @RequestParam String ppw) {
        return providerService.authenticate(email, ppw);
    }
}
