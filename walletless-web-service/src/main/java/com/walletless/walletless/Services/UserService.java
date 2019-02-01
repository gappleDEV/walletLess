package com.walletless.walletless.Services;

import com.walletless.walletless.Entities.User;

import java.util.List;

public interface UserService {
    public List<User> getAllUsers();
    public List<User> getUsersById(List<Integer> ids);
    public User getUserById(Integer id);
    public User updateUser(User user);
    public User createUser(User user);
    public List<User> createUsers(List<User> users);
}
