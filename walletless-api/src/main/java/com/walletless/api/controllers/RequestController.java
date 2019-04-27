package com.walletless.api.controllers;

import com.walletless.api.models.Provider;
import com.walletless.api.models.Request;
import com.walletless.api.models.User;
import com.walletless.api.services.IRequestService;
import com.walletless.api.vo.RequestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path="/request")
public class RequestController {

    @Autowired
    private IRequestService requestService;

    @PostMapping(path="/new")
    @ResponseBody
    public Request newRequest(@RequestBody RequestVO requestVO){
        if (requestVO.message == null || requestVO.message.isEmpty()){
            requestVO.message = "You have recieved a request for information from " + requestVO.provider.getProviderUserName()
                            + "with " + requestVO.provider.getProviderName();
        }

        return requestService.createNewRequest(requestVO.message, requestVO.user, requestVO.provider);
    }

    @PostMapping(path="/approve")
    @ResponseBody
    public Request approveRequest(@RequestBody Integer requestId){
        return requestService.updateRequestStatus(requestId, "open");
    }

    @PostMapping(path="/getAllByUser")
    @ResponseBody
    public List<Request> getAllRequestsByUser(@RequestBody User user) {
        return requestService.getAllRequestsByUser(user);
    }

    @PostMapping(path="/getAllByProvider")
    @ResponseBody
    public List<Request> getAllRequestsByUser(@RequestBody Provider provider) {
        return requestService.getAllRequestsByProvider(provider);
    }
}
