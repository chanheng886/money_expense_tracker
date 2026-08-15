package com.example.backend.dtos.AuthDtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthRegisterRequestDTO {
    @Size(max = 50, message = "your email is too long")
    @NotBlank(message = "email is required")
    private String email;
    @Size(max = 100, message = "password is too long")
    @NotBlank(message = "password is required")
    private String password;

    //✅ User can updated later
    private String username;
    private String phone;
    private String gender;
}