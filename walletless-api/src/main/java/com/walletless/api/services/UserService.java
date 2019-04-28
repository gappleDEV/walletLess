package com.walletless.api.services;


import com.walletless.api.dao.UserRepository;
import com.walletless.api.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService implements IUserService{

    @Autowired
    private UserRepository userRepository;

    public User createNewUser(String email, String upw) {
        if (userRepository.findByEmail(email) == null){
            return userRepository.save(new User(email, upw.hashCode()));
        }
        return null;
    }

    public User authenticate(String email, String upw) {
        User user = userRepository.findByEmail(email);
        if(user != null && user.getUpw() == upw.hashCode())
            return user;
        return null;
    }

}
