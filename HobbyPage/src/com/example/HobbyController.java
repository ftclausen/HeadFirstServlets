package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class HobbyController extends HttpServlet {
    public void doPost(HttpServletRequest request,
                    HttpServletResponse response) throws IOException, ServletException {
        HobbyModel hobbyCohortFinder = new HobbyModel();
        String hobby = request.getParameter("hobby");
        List<String> cohorts = hobbyCohortFinder.getHobbyCohorts(hobby);
        request.setAttribute("cohorts", cohorts);
        RequestDispatcher view = request.getRequestDispatcher("cohorts.jsp");
        view.forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}
