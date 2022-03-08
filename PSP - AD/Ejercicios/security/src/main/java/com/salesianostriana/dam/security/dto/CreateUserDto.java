package com.salesianostriana.dam.security.dto;

import lombok.*;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class CreateUserDto {
    String email;
    String password, password2;
    String avatar;
}
