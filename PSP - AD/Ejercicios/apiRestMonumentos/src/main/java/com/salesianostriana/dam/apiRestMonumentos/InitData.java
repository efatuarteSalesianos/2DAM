package com.salesianostriana.dam.apiRestMonumentos;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Arrays;

@Component
@RequiredArgsConstructor
public class InitData {

    private final MonumentoRepository repository;

    @PostConstruct
    public void initData(){
        repository.saveAll(
                Arrays.asList(
                        new Monumento("ES", "España", "Sevilla", new int[]{37,5}, "Torre del Oro", "La Torre del Oro de Sevilla", "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Torre_del_Oro_flag_Seville_Spain.jpg/420px-Torre_del_Oro_flag_Seville_Spain.jpg"),
                        new Monumento("FR", "Francia", "París", new int[]{48,2},"Torre Eiffel", "La Torre Eiffel está situada en el extremo del Campo de Marte a la orilla del río Sena", "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Tour_eiffel_at_sunrise_from_the_trocadero.jpg/413px-Tour_eiffel_at_sunrise_from_the_trocadero.jpg"),
                        new Monumento("IT", "Italia", "Roma", new int[]{41,12}, "Coliseo Romano", "El Coliseo o Anfiteatro Flavio es un anfiteatro de la época del Imperio romano", "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Colosseo_2020.jpg/368px-Colosseo_2020.jpg"),
                        new Monumento("ES", "España", "Zaragoza", new int[]{41,0}, "Basílica del Pilar", "La catedral-basílica de Nuestra Señora del Pilar de Zaragoza", "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Basilica_del_Pilar_ZaragozaAragon%28Spain%29-2.jpg/420px-Basilica_del_Pilar_ZaragozaAragon%28Spain%29-2.jpg"),
                        new Monumento("UK", "Reino Unido", "Londres", new int[]{51,0}, "Big Ben", "Big Ben es el nombre con el que se conoce a la gran campana del reloj situado en el lado noroeste del Palacio de Westminster.", "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Clock_Tower_-_Palace_of_Westminster%2C_London_-_September_2006.jpg/800px-Clock_Tower_-_Palace_of_Westminster%2C_London_-_September_2006.jpg")
                )
        );
    }

}
