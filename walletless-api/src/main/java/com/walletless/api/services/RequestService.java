package com.walletless.api.services;

import com.walletless.api.dao.RequestRepository;
import com.walletless.api.models.Provider;
import com.walletless.api.models.Request;
import com.walletless.api.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service("requestService")
public class RequestService implements IRequestService {

    @Autowired
    private RequestRepository requestRepository;

    public Request createNewRequest(String message, User user, Provider provider){
        return requestRepository.save(new Request(message, user, provider));
    }

    public Request updateRequestStatus(Integer requestId, String status) {
        Optional<Request> reqOp = requestRepository.findById(requestId);

        if (reqOp.isPresent()){
            Request req = reqOp.get();

            if (!req.getStatus().equals(status)){
                req.setStatus(status);
                return requestRepository.save(req);
            }
        }

        return null;
    }

    public List<Request> getAllRequestsByUser(User user) {
        return requestRepository.findAllByUser(user);
    }

    public List<Request> getAllRequestsByProvider(Provider provider){
        return requestRepository.findAllByProvider(provider);
    }
}
