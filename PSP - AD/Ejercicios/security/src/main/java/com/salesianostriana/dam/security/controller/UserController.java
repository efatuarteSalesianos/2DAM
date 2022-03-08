package com.salesianostriana.dam.security.controller;

import com.salesianostriana.dam.security.dto.CreateUserDto;
import com.salesianostriana.dam.security.model.User;
import com.salesianostriana.dam.security.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Component
@RequiredArgsConstructor
public class UserController {

    private final UserService service;

    @GetMapping("/")
    public ResponseEntity<User> doRegister(@RequestBody CreateUserDto newUser) {
        User created = service.save(newUser);
        if ( created == null )
            return ResponseEntity.badRequest().build();
        else
            return ResponseEntity.status(201).body(created);
    }

}
