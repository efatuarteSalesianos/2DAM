package com.salesianostriana.dam.security.services;

import com.salesianostriana.dam.security.dto.CreateUserDto;
import com.salesianostriana.dam.security.model.User;
import com.salesianostriana.dam.security.repos.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userDetailsService")
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository repository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return repository.findFirstByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Email no encontrado"));
    }

}
