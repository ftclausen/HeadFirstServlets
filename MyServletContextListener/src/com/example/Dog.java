package com.example;

import javax.servlet.http.*;

public class Dog implements HttpSessionBindingListener {
    private String breed;

    public Dog(String breed) {
        this.breed = breed;
    }
    
    public String getBreed() {
        return breed;
    }

    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println("DEBUG: We are being bound yeah!");
    }

    public void valueUnbound(HttpSessionBindingEvent event) {
        System.out.println("DEBUG: We are being unbound nay!");
    }
}
