package com.walletless.api.services;

import com.walletless.api.models.User;

public interface IUserService {
    User createNewUser(String email, String upw);
    User authenticate(String email, String upw);
}
