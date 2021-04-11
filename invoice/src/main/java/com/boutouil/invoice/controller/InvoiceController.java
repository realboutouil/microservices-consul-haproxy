package com.boutouil.invoice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@CrossOrigin("*")
@RequestMapping
public class InvoiceController {

    private final String service;

    @Autowired
    public InvoiceController(@Value("${spring.application.name:service}") String service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<Object> serviceUp() {
        return ResponseEntity.ok().body(Map.of("status", "UP", "service", service));
    }
}