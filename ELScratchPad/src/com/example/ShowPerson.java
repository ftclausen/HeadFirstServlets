package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class ShowPerson extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
                    throws IOException, ServletException {

        Person p = new Person();
        String submittedName = request.getParameter("name");
        if (submittedName.equalsIgnoreCase("")) {
            System.out.println("WARN: Setting name to \"Fred\" since no name given");
            p.setName("Fred");
        } else {
            p.setName(submittedName);
        }

        Map musicMap = new HashMap();
        musicMap.put("Ambient", "Zero 7");
        musicMap.put("Surf", "Tahiti 80");
        request.setAttribute("musicMap", musicMap);
        String[] genreList = {"Surf", "Ambient"};
        request.setAttribute("genres", genreList);
        request.setAttribute("person", p);

        RequestDispatcher view = request.getRequestDispatcher("ELTest.jsp");
        view.forward(request, response);
    }
}
