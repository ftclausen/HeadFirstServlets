package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class ListenerTester extends HttpServlet {
    public void doGet (HttpServletRequest request, HttpServletResponse response) 
                throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
    
        HttpSession session = request.getSession();
        session.setAttribute("foo", "42");
        // session.setMaxInactiveInterval(3600);

        if (session.isNew()) {
            out.println("<h3>This is a new session (or session expired). Welcome new user</h3>");
        } else {
            out.println("<h3>Welcome back!</h3>");
        }

        long sessionLastAccessed = session.getLastAccessedTime();
        long sessionMaxInactive = session.getMaxInactiveInterval()*1000;
        long sessionCreated = session.getCreationTime();
        long currentTime = System.currentTimeMillis();

        out.println("Sesssion last accessed = " + sessionLastAccessed + "<br>");
        out.println("Sesssion maxInactive = " + sessionMaxInactive + "<br>");
        int hardTimeout = 10;
        long remaining = (hardTimeout * 1000) - (currentTime - sessionCreated);
        out.println("Remaining time to hard expiration = " + remaining / 1000);
        if (remaining <= 0) {
            session.invalidate();
        }

        out.println("<hr>");
        out.println("Testing context attributes set by listener. Right now. Right here<br>");

        Dog dog = (Dog) getServletContext().getAttribute("dog");
        out.println("Our dog has breed " + dog.getBreed());
        out.println("Testing change");
    }
}
