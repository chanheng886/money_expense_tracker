package com.example.backend.security;
import java.util.Date;
import javax.crypto.SecretKey;
import org.springframework.stereotype.Service;
import com.example.backend.entity.Auth;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Service
public class JwtService {
    private final SecretKey secretKey = Keys.hmacShaKeyFor("QMADl+sNfKgvSJjB4ObLyH2bHgeVRKkHSOSHXFgPwMk=".getBytes());

    private final long expiration = 1000 * 60 * 60;
    public String generateToken(Auth auth){
        return Jwts.builder()
            .subject(auth.getEmail())
            .claim("id", auth.getId())
            .claim("role", auth.getRole().name())
            .issuedAt(new Date())
            .expiration(new Date(System.currentTimeMillis() + expiration))
            .signWith(secretKey)
            .compact();
    }

    public String extractEmail(String token){
        return Jwts.parser()
        .verifyWith(secretKey)
        .build()
        .parseSignedClaims(token)
        .getPayload()
        .getSubject();
    }

    public boolean isTokenValid(String token){
        try{
            Jwts.parser()
            .verifyWith(secretKey)
            .build()
            .parseSignedClaims(token);

            return true;
        }catch(Exception e){
            return false;
        }
    }
}
