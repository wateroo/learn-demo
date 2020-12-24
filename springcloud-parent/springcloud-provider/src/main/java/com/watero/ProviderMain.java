package com.watero;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class ProviderMain {
	public static void main(String[] args) {
		SpringApplication.run(ProviderMain.class, args);
	}
}
