package com.salesianostriana.dam.testsMockito;

import com.salesianostriana.dam.ejerciciotesting.model.Cliente;
import com.salesianostriana.dam.ejerciciotesting.model.LineaDeVenta;
import com.salesianostriana.dam.ejerciciotesting.model.Producto;
import com.salesianostriana.dam.ejerciciotesting.model.Venta;
import com.salesianostriana.dam.ejerciciotesting.repos.ProductoRepositorio;
import com.salesianostriana.dam.ejerciciotesting.repos.VentaRepositorio;
import com.salesianostriana.dam.ejerciciotesting.services.VentaServicio;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import javax.sound.sampled.Line;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.lenient;

@ExtendWith(MockitoExtension.class)
class VentaServicioTest {

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
        Producto p = new Producto("3", "Teclado mecánico retroiluminado", 59.99);

        lenient().when(productoRepositorio.findOne("3")).thenReturn(p);

        // Creo una linea de venta para poder agregarla a la nueva venta
        LineaDeVenta ldv = new LineaDeVenta(p, 5, p.getPrecio());
        // Añadir una venta manual para comprobar que es igual a la que se genera cuando llamamos al servicio
        Venta v = new Venta();
        v.setCliente(c);
        v.setId(2L);
        v.setLineasDeVenta(List.of(ldv));

        Venta result = ventaServicio.nuevaVenta(Map.of("3", 5), c);

        assertNotNull(result);
        assertNotNull(result.getCliente());
        assertEquals(v, result);
    }

    @Test
    void addProductoToVenta() {
        Producto p = new Producto("3", "Teclado mecánico retroiluminado", 59.99);

        Optional<Venta> v = Optional.of(new Venta());

        lenient().when(ventaRepositorio.findOneOptional(1L)).thenReturn(v);
        lenient().when(productoRepositorio.findOne("3")).thenReturn(p);

        LineaDeVenta ldv = new LineaDeVenta(p, 5, p.getPrecio());
        Venta result = ventaServicio.addProductoToVenta(1L, p.getCodigoProducto(), 5);

        assertTrue(result.getLineasDeVenta().contains(ldv));
    }

    @Test
    void removeLineaVenta() {
        Producto p = new Producto("3", "Teclado mecánico retroiluminado", 59.99);

        Optional<Venta> v = Optional.of(new Venta());

        lenient().when(ventaRepositorio.findOneOptional(1L)).thenReturn(v);
        lenient().when(productoRepositorio.findOne("3")).thenReturn(p);

        LineaDeVenta ldv = new LineaDeVenta(p, 5, p.getPrecio());

        Venta result = ventaServicio.removeLineaVenta(1L, "3");

        assertFalse(result.getLineasDeVenta().contains(ldv));
    }
}