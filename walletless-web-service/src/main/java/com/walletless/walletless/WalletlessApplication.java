package com.walletless.walletless;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class WalletlessApplication {

	public static void main(String[] args) {
		SpringApplication.run(WalletlessApplication.class, args);
	}

}

