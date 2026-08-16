package com.example.backend.service;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.backend.entity.Auth;
import com.example.backend.repository.AuthRegisterRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {
    private final AuthRegisterRepository authRegisterRepository;
    
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Auth auth = authRegisterRepository.findByEmail(email).orElseThrow(() -> new RuntimeException("Email not found!!"));

        return User
            .withUsername(auth.getEmail())
            .password(auth.getPassword())
            .roles(auth.getRole().name())
            .build();
    }
}