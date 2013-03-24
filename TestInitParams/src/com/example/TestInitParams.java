package com.example;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class TestInitParams extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Testing init parameters. <blink>Yo</blink>.<br>");

        java.util.Enumeration e = getServletConfig().getInitParameterNames();
        while(e.hasMoreElements()) {
            out.println("<br>param name = " + e.nextElement() + "<br>");
        }
       
        ServletContext sc = getServletContext(); 
        out.println("Main email is " + sc.getInitParameter("mainEmail") + "<br>");
        out.println("Admin email is " + sc.getInitParameter("adminEmail") + "<br>");
        sc.log("This is a log message");
        out.println("This is server : " + sc.getMajorVersion());
    }
}
