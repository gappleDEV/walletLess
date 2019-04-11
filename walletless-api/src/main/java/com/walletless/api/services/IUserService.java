package com.walletless.api.services;

import com.walletless.api.models.User;

public interface IUserService {
    public User createNewUser(String email, String upw);
    public User authenticate(String email, String upw);
}
