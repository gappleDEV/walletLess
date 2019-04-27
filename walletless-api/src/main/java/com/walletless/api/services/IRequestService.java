package com.walletless.api.services;

import com.walletless.api.models.Provider;
import com.walletless.api.models.Request;
import com.walletless.api.models.User;

import java.util.List;

public interface IRequestService {
    Request createNewRequest(String message, User user, Provider provider);
    Request updateRequestStatus(Integer requestId, String status);
    List<Request> getAllRequestsByUser(User user);
    List<Request> getAllRequestsByProvider(Provider provider);
}
