package com.example.demo.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.GreeetingService;

/**
 * REST controller for greeting API.
 */
@RestController
public class GreetingController {

    private final GreeetingService greetingService;

    public GreetingController(GreeetingService greetingService) {
        this.greetingService = greetingService;
    }

    /**
     * Endpoint to return a greeting message.
     *
     * @param name optional name parameter
     * @return map containing greeting message
     */
    @GetMapping("/api/greet")
    public Map<String, String> greet(@RequestParam(required = false) String name) {
        return Map.of("message", greetingService.hello(name));
    }
}
