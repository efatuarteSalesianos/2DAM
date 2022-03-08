package com.salesianostriana.dam.security.services;

import com.salesianostriana.dam.security.dto.CreateUserDto;
import com.salesianostriana.dam.security.model.Roles;
import com.salesianostriana.dam.security.model.User;
import com.salesianostriana.dam.security.repos.UserRepository;
import com.salesianostriana.dam.security.services.base.BaseService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService extends BaseService<User, Long, UserRepository> {

    private final PasswordEncoder encoder;

    public Optional<User> findUserByUsername(String email) {
        return this.repositorio.findFirstByEmail(email);
    }

    public User save(CreateUserDto newUser) {
        if(newUser.getPassword().equals(newUser.getPassword2())){
            return this.repositorio.save(
                    User.builder()
                            .email(newUser.getEmail())
                            .password(encoder.encode(newUser.getPassword()))
                            .role(Roles.USER)
                            .build()
            );
        } else {
            // Aqui deberíamos lanzar una excepción, lo veremos en el Tema 4
            return null;
        }
    }
}
