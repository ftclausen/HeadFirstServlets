package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class ListenerTester extends HttpServlet {
    public void doGet (HttpServletRequest request, HttpServletResponse response) 
                throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
    
        out.println("Testing context attributes set by listener. Right now. Right here<br>");

        Dog dog = (Dog) getServletContext().getAttribute("dog");
        out.println("Our dog has breed " + dog.getBreed());
        out.println("Testing change");
    }
}
