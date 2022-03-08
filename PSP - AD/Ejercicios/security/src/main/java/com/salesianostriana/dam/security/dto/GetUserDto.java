package com.salesianostriana.dam.security.dto;

import com.salesianostriana.dam.security.model.Roles;
import lombok.*;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class GetUserDto {
    private String username;
    private String avatar;
    private Roles role;
}
