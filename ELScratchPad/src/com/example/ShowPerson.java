package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class ShowPerson extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
                    throws IOException, ServletException {

        Person p = new Person();
        String submittedName = request.getParameter("firstname");
        if (submittedName.equalsIgnoreCase("")) {
            System.out.println("WARN: Setting name to \"Fred\" since no name given");
            p.setName("Fred");
        } else {
            p.setName(submittedName);
        }
        request.setAttribute("person", p);

        RequestDispatcher view = request.getRequestDispatcher("ELTest.jsp");
        view.forward(request, response);
    }
}
