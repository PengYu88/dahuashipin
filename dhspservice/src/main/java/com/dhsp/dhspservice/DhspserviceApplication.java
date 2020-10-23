package com.dhsp.dhspservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
@EnableTransactionManagement
public class DhspserviceApplication {

    public static void main(String[] args) {
        SpringApplication.run(DhspserviceApplication.class, args);
    }

}
