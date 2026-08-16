package com.example.backend.mapper;
import org.springframework.stereotype.Component;
import com.example.backend.dtos.AuthDtos.AuthLoginResponseDTO;
import com.example.backend.dtos.AuthDtos.AuthRegisterRequestDTO;
import com.example.backend.dtos.AuthDtos.AuthRegisterResponseDTO;
import com.example.backend.entity.Auth;
import com.example.backend.enums.Roles;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AuthRegisterMapper {
        public Auth toEntity(AuthRegisterRequestDTO dto){
            return Auth.builder()
            .username(dto.getUsername())
            .gender((dto.getGender()))
            .email(dto.getEmail())
            .password(dto.getPassword())
            .role(Roles.USER)
            .phone(dto.getPhone())
            .build();
        }

        public Auth toUpdate(Auth auth, AuthRegisterRequestDTO dto){
            auth.setUsername(dto.getUsername());
            auth.setGender(dto.getGender());
            auth.setEmail(dto.getEmail());
            auth.setPhone(dto.getPhone());

            return auth;
        }

        public AuthRegisterResponseDTO toResponse(Auth auth){
            return AuthRegisterResponseDTO.builder()
            .id(auth.getId())
            .username(auth.getUsername())
            .gender(auth.getGender())
            .email(auth.getEmail())
            .role(Roles.USER.name())
            .phone(auth.getPhone())
            .build();
        }

        //✅✅ To login response: response some basic information 
        public AuthLoginResponseDTO toLoginResponse(Auth auth){
            return AuthLoginResponseDTO.builder()
            .id(auth.getId())
            .email(auth.getEmail())
            .password(auth.getPassword())
            .role(auth.getRole())
            .build();
        }


}