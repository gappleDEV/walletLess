package com.walletless.walletless.Controllers;

import com.walletless.walletless.Entities.User;
import com.walletless.walletless.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/users")
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @PostMapping("/users")
    public List<User> getUsersById(@RequestBody List<Integer> userIds){
        return userService.getUsersById(userIds);
    }

    @GetMapping("/user/{userId}")
    public User getUserById(@PathVariable Integer userId){
        return userService.getUserById(userId);
    }

    @PostMapping("user/update")
    public User updateUser(@RequestBody User user){
        return userService.updateUser(user);
    }

    @PostMapping("user/new")
    public User createNewUser(@RequestBody User user){
        return userService.createUser(user);
    }

    @PostMapping("users/new")
    public List<User> createNewUsers(@RequestBody List<User> users){
        return userService.createUsers(users);
    }
}
