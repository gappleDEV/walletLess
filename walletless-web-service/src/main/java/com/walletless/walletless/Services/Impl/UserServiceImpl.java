package com.walletless.walletless.Services.Impl;

import com.walletless.walletless.DAO.IUserDao;
import com.walletless.walletless.Entities.User;
import com.walletless.walletless.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private IUserDao userDao;

    public List<User> getAllUsers(){
        return userDao.findAll();
    }

    public List<User> getUsersById(List<Integer> ids){
        return userDao.findAllById(ids);
    }

    public User getUserById(Integer id){
        return userDao.getOne(id);
    }

    public User updateUser(User user){
        return userDao.save(user);
    }

    public User createUser(User user){
        return userDao.save(user);
    }

    public List<User> createUsers(List<User> users){
        return userDao.saveAll(users);
    }
}
