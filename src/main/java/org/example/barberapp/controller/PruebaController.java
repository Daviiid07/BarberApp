package org.example.barberapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class PruebaController {
    @GetMapping("/prueba")
    public String prueba() {
        return "Conexión con BarberApp correcta";
    }
}
