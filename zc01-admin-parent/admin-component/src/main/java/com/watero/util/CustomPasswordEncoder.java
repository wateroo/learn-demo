package com.watero.util;

import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.crypto.digest.MD5;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Objects;

/**
 *
 */
@Component
public class CustomPasswordEncoder implements PasswordEncoder {
    @Override
    public String encode(CharSequence rawPassword) {
        String md5Hex = DigestUtil.md5Hex(rawPassword.toString());
        return md5Hex;
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        String md5Hex = DigestUtil.md5Hex(rawPassword.toString());
        return Objects.equals(md5Hex, encodedPassword);
    }
}
