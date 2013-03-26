package com.example;

import javax.servlet.*;

public class MyServletContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        System.out.println("DEBUG: Starting context initialisation. woot");
        ServletContext sc = event.getServletContext();
        String dogBreed = sc.getInitParameter("breed");
        Dog d = new Dog(dogBreed);
        sc.setAttribute("dog", d);
    }

    public void contextDestroyed(ServletContextEvent event) {
        System.out.println("DEBUG: Context going down yeah. Down baby.");
    }
}
