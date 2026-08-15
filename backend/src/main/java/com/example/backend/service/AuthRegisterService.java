package com.example.backend.service;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.backend.dtos.AuthDtos.AuthRegisterRequestDTO;
import com.example.backend.dtos.AuthDtos.AuthRegisterResponseDTO;
import com.example.backend.entity.Auth;
import com.example.backend.enums.Roles;
import com.example.backend.mapper.AuthRegisterMapper;
import com.example.backend.repository.AuthRegisterRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AuthRegisterService {
    private final AuthRegisterMapper authRegisterMapper;
    private final AuthRegisterRepository authRegisterRepository;
    private final PasswordEncoder passwordEncoder;

    //✅✅ Create User By Admin
    public AuthRegisterResponseDTO createUser(AuthRegisterRequestDTO dto){
        Auth auth = authRegisterMapper.toEntity(dto);
        auth.setPassword(passwordEncoder.encode(auth.getPassword()));
        auth.setRole(Roles.USER);
        Auth save = authRegisterRepository.save(auth);

        return authRegisterMapper.toResponse(save);
    }

    // ✅✅ Get all user 
    public List<AuthRegisterResponseDTO> getAllUser(){
        return authRegisterRepository
            .findAll()
            .stream()
            .map(authRegisterMapper::toResponse)
            .collect(Collectors.toList());
    }

    //✅✅ Promote user to Admin
    public AuthRegisterResponseDTO promoteUser(Long id){
        Auth auth = authRegisterRepository.findById(id).orElseThrow(() -> new RuntimeException("Uer id with: " + id + "Not Found!!"));
        auth.setRole(Roles.USER);
        Auth save = authRegisterRepository.save(auth);
       
        return authRegisterMapper.toResponse(save);
    }

    //✅✅ Delete User by admin
    public void deleteUserByAdmin(Long id){
        Auth auth = authRegisterRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("User with id: " + id + "Not Found!"));
        authRegisterRepository.delete(auth);
    }

    //✅✅ Register by User
    public AuthRegisterResponseDTO userRegister(AuthRegisterRequestDTO dto){
        if(authRegisterRepository.existsByEmail(dto.getEmail())){
            throw new RuntimeException("Email has already register, try another!!");
        }
        Auth auth = new Auth();
        auth.setEmail(dto.getEmail());
        auth.setPassword(passwordEncoder.encode(dto.getPassword()));
        auth.setRole(Roles.USER);
        Auth save = authRegisterRepository.save(auth);
        return authRegisterMapper.toResponse(save); 
    }

    //✅✅ User update account by them self
    // public AuthRegisterResponseDTO userAccountUpdate(AuthRegisterRequestDTO dto){
    //     Auth update = authRegisterMapper.toUpdate(dto);
    //     Auth save = authRegisterRepository.save(update);

    //     return authRegisterMapper.toResponse(save); 
    // }
}