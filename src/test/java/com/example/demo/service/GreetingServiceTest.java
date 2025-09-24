package com.example.demo.service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Unit tests for {@link GreetingService}.
 */
class GreetingServiceTest {

    /**
     * Verifies that hello() returns the default greeting
     * when the name is null.
     */
    @Test
    void helloReturnsDefault() {
        GreeetingService service = new GreeetingService();
        assertEquals("Hello, world", service.hello(null));
    }

    /**
     * Verifies that hello() returns a personalized greeting
     * when a name is provided.
     */
    @Test
    void helloWithName() {
        GreeetingService service = new GreeetingService();
        assertEquals("Hello, Asmita", service.hello("Asmita"));
    }
}
