package com.walletless.walletlesswebservice.controller;

import com.walletless.walletlesswebservice.exception.ResourceNotFoundException;
import com.walletless.walletlesswebservice.model.UserAccount;
import com.walletless.walletlesswebservice.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api")
public class UserAccountController {

    @Autowired
    UserRepository userRepository;

    //Get all users
    @GetMapping("/users")
    public List<UserAccount> getAllUsers(){
        return userRepository.findAll();
    }

    //create new user
    @PostMapping("/users")
    public UserAccount createUser(@Valid @RequestBody UserAccount user){
        return userRepository.save(user);
    }

    //get a single user
    @GetMapping("/users/{id}")
    public UserAccount getUserById(@PathVariable(value = "id") Long userId){
        return userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("UserAccount", "id", userId));
    }

    //update a user
    @PutMapping("/users/{id}")
    public UserAccount updateUser(@PathVariable(value = "id") Long userId, @Valid @RequestBody UserAccount userDetails){
        UserAccount user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("UserAccount", "id", userId));

        user.setUsername(userDetails.getUsername());
        user.setPassword(userDetails.getPassword());
        user.setAcctType(userDetails.getAcctType());
        user.setCreateDate(userDetails.getCreateDate());
        user.setIsActive(userDetails.getIsActive());

        UserAccount updatedUser = userRepository.save(user);
        return updatedUser;
    }

    //delete a user
    @DeleteMapping("/users/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable(value = "id") Long userId){
        UserAccount user = userRepository.findById(userId).orElseThrow(() -> new ResourceNotFoundException("UserAccount", "id", userId));

        userRepository.delete(user);

        return ResponseEntity.ok().build();
    }
}
