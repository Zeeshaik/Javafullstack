package com.zeeshaik.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Alien {

    @Autowired
    Laptop lap;
    void code() {
        lap.compile();
    }
}
