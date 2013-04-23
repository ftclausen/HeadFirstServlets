package com.example;

import javax.servlet.*;
import javax.servlet.http.*;

public class MyServletContextListener implements ServletContextListener, HttpSessionListener  {

    static private int activeSessions;

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

    public static int getActiveSessions() {
        return activeSessions;
    }

    public synchronized void sessionCreated(HttpSessionEvent event) {
        activeSessions++;
        System.out.println("DEBUG: Increasing session counter to " + getActiveSessions());
        synchronized(getServletContext()) {
            getServletContext().setAttribute("sessions", activeSessions);
        }
    }

    public synchronized void sessionDestroyed(HttpSessionEvent event) {
        activeSessions--;
        System.out.println("DEBUG: Decreasing session counter to " + getActiveSessions());
    }

}
