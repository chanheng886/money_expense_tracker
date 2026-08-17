package com.example.backend.controller;
import java.util.List;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.backend.dtos.AuthDtos.AuthLoginResponseDTO;
import com.example.backend.dtos.AuthDtos.AuthRegisterRequestDTO;
import com.example.backend.dtos.AuthDtos.AuthRegisterResponseDTO;
import com.example.backend.service.AuthRegisterService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/auth-users")
@RequiredArgsConstructor
public class AuthRegisterController {
    private final AuthRegisterService authRegisterService;

    @GetMapping("/get-all")
    public List<AuthRegisterResponseDTO> getAllAuthUser(){
        return authRegisterService.getAllUser();
    }

    @PostMapping("/admin-create")
    public AuthRegisterResponseDTO createUser(@Valid @RequestBody AuthRegisterRequestDTO dto){
        return authRegisterService.createUser(dto);
    }

    //✅ Promote User to admin
    @PutMapping("/admin-update/{id}")
    public AuthRegisterResponseDTO promoteUserToAdminByAdmin(@PathVariable Long id){
        return authRegisterService.promoteUser(id);
    }

    //✅✅ Delete user by admin
    @DeleteMapping("/{id}")
    public void deleteUserByAdmin(@PathVariable Long id){
        authRegisterService.deleteUserByAdmin(id);
    }

    //✅✅ Auth Register by themeself
    @PostMapping("/register")
    public AuthRegisterResponseDTO userRegister(@Valid @RequestBody AuthRegisterRequestDTO dto){
        return authRegisterService.userRegister(dto);
    }
    //✅✅ Auth Login by user

    @PostMapping("/login")
    public AuthLoginResponseDTO loginByUser(@Valid @RequestBody AuthRegisterRequestDTO dto){
        return authRegisterService.userLogin(dto);
    }
}
