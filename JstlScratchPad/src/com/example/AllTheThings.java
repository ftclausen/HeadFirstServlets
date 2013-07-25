package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class AllTheThings extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws IOException, ServletException {
        String tip = request.getParameter("tip");
        String incomingMovies = request.getParameter("movies");
        if (tip == null || tip.equalsIgnoreCase("")) {
            System.out.println("WARN: Setting tip to standard value, none given.");
            tip = "No Tip <b>given!!</b>";
        }

        List<String> movies = null;
        if (incomingMovies == null || incomingMovies.equalsIgnoreCase("")) {
            System.out.println("WARN: Setting movies to standard value, none given.");
            movies = new ArrayList<String>();
            movies.add("Default Dave Does Dallas");
        } else {
            movies = Arrays.asList(incomingMovies.split(","));
        }
        String food = request.getParameter("food");
        if (request.getParameter("food") == null || 
            request.getParameter("food").equalsIgnoreCase("")) {
            food = "default dessert";
        }
            
        request.setAttribute("movies", movies);
        request.setAttribute("tip", tip);
        request.setAttribute("food", food);
        RequestDispatcher view = request.getRequestDispatcher("ShowAllTheThings.jsp");
        view.forward(request, response);
    }
}
