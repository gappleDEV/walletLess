package com.walletless.api.controllers;

import com.walletless.api.models.User;
import com.walletless.api.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @GetMapping(path="/create")
    @ResponseBody
    public User createUser(@RequestParam String email, @RequestParam String upw) {
        return userService.createNewUser(email, upw);
    }

    @GetMapping(path="/authenticate")
    @ResponseBody
    public User authenticateUser(@RequestParam String email, @RequestParam String upw) {
        return userService.authenticate(email, upw);
    }
}
