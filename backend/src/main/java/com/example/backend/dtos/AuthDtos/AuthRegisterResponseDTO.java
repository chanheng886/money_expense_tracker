package com.example.backend.dtos.AuthDtos;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AuthRegisterResponseDTO {
    private Long id;
    private String username;
    private String gender;
    private String role;
    private String email;
    private String phone;    
}
