package com.example.app;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class ApplicationTest {
    @Test
    void storesAndReturnsApplicationDetails() {
        Application application = new Application("MyApp", "1.0");

        assertEquals("MyApp", application.getName());
        assertEquals("1.0", application.getVersion());
    }
}