package com.walletless.walletlesswebservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class WalletlessWebserviceApplication {
    public static void main(String[] args) {
        SpringApplication.run(WalletlessWebserviceApplication.class, args);
    }
}
