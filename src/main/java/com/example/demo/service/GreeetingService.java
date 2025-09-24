package com.example.demo.service;

import org.springframework.stereotype.Service;

/**
 * Service class for generating greeting messages.
 */
@Service
public class GreeetingService {

    /**
     * Returns a greeting message.
     *
     * @param name the optional name
     * @return a greeting message
     */
    public String hello(String name) {
        if (name == null || name.isBlank()) {
            return "Hello, world";
        }
        return "Hello, " + name;
    }
}
