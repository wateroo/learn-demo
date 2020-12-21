package com.watero.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Demo {
    public static void main(String[] args) {
        String encode = new BCryptPasswordEncoder().encode("123");
        System.out.println(encode);
    }
}
