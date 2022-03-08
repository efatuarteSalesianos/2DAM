package com.salesianostriana.dam;

import com.salesianostriana.dam.model.Cliente;
import com.salesianostriana.dam.model.LineaDeVenta;
import com.salesianostriana.dam.model.Producto;
import com.salesianostriana.dam.model.Venta;
import com.salesianostriana.dam.repos.ProductoRepositorio;
import com.salesianostriana.dam.repos.VentaRepositorio;
import com.salesianostriana.dam.service.VentaServicio;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.Mockito.lenient;

@ExtendWith(MockitoExtension.class)
public class VentaServicioTest {

    @Mock
    ProductoRepositorio productoRepositorio;

    @Mock
    VentaRepositorio ventaRepositorio;

    @InjectMocks
    VentaServicio ventaServicio;

    @Test
    void nuevaVenta() {
        Cliente c = Cliente.builder()
                .dni("12345A")
                .nombre("Pepe Pérez")
                .email("pepeperez@email.com")
                .build();

        Optional<Producto> p = Optional.of(Producto.builder()
                                        .id(1L)
                                        .nombre("Teclado mecánico RGB")
                                        .codigoProducto("1")
                                        .precio(69.99)
                                        .build());

        lenient().when(productoRepositorio.findById(1L)).thenReturn(p);

        // Añadir una venta manual para comprobar que es igual a la que se genera cuando llamamos al servicio
        Venta v = new Venta();
        v.setCliente(c);
        v.setId(2L);
        // Creo una linea de venta para poder agregarla a la nueva venta
        LineaDeVenta ldv = LineaDeVenta.builder()
                .id(1L)
                .producto(p.get())
                .cantidad(10)
                .pvp(p.get().getPrecio())
                .build();

        v.addLineaVenta(ldv);

        Venta result = ventaServicio.nuevaVenta(Map.of(1L, 10), c);

        result.getLineasDeVenta().forEach(l -> assertTrue(l.getCantidad()==10&l.getProducto().equals(p.get())));
    }

    @Test
    void addProductoToVenta() {
        Cliente c = Cliente.builder()
                .dni("12345A")
                .nombre("Pepe Pérez")
                .email("pepeperez@email.com")
                .build();

        Optional<Producto> p = Optional.of(Producto.builder()
                                        .id(1L)
                                        .nombre("Teclado mecánico retroiluminado")
                                        .codigoProducto("1")
                                        .precio(59.99)
                                        .build());

        Optional<Venta> v = Optional.of(new Venta());
        v.get().setCliente(c);
        v.get().setId(2L);

        lenient().when(ventaRepositorio.findById(1L)).thenReturn(v);
        lenient().when(productoRepositorio.findById(1L)).thenReturn(p);

        LineaDeVenta ldv = LineaDeVenta.builder()
                .id(1L)
                .producto(p.get())
                .cantidad(10)
                .pvp(p.get().getPrecio())
                .build();

        v.get().addLineaVenta(ldv);

        Venta result = ventaServicio.addProductoToVenta(1L, p.get().getId(), 5);

        assertEquals(v.get().getLineasDeVenta(), result.getLineasDeVenta());
    }

    @Test
    void removeLineaVenta() {
        Cliente c = Cliente.builder()
                .dni("12345A")
                .nombre("Pepe Pérez")
                .email("pepeperez@email.com")
                .build();

        Optional<Producto> p = Optional.of(Producto.builder()
                                        .id(1L)
                                        .nombre("Teclado mecánico retroiluminado")
                                        .codigoProducto("1")
                                        .precio(59.99)
                                        .build());

        Optional<Venta> v = Optional.of(new Venta());
        v.get().setCliente(c);
        v.get().setId(2L);

        LineaDeVenta ldv = LineaDeVenta.builder()
                .id(1L)
                .producto(p.get())
                .cantidad(10)
                .pvp(p.get().getPrecio())
                .build();

        v.get().addLineaVenta(ldv);

        lenient().when(ventaRepositorio.findById(1L)).thenReturn(v);
        lenient().when(productoRepositorio.findById(1L)).thenReturn(p);

        Venta result = ventaServicio.removeLineaVenta(1L, 1L);

        assertFalse(result.getLineasDeVenta().contains(ldv));
    }
}
