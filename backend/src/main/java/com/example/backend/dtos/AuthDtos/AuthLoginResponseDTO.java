package com.example.backend.dtos.AuthDtos;

import com.example.backend.enums.Roles;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class AuthLoginResponseDTO {
    private Long id;
    private String email;
    private String password;
    private Roles role;
}
