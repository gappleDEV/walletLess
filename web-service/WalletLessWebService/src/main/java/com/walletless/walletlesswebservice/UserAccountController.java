package com.walletless.walletlesswebservice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/api")
public class UserAccountController {

    @RequestMapping("/users")
    @ResponseBody
    public UserAccount getUserAccount(){
        return new UserAccount("1", "testUsername", "password", 0,1);
    }
}
