package com.example.web;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.example.model.*;

public class BeerSelect extends HttpServlet {
    public void doPost(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        String c = request.getParameter("color");
        
        BeerExpert beerTips = new BeerExpert();
        List<String> brands = beerTips.getBrands(c);

        request.setAttribute("brands", brands);
        RequestDispatcher view = request.getRequestDispatcher("result.jsp");
        view.forward(request, response);

        //for (String s: brands) {
        //   out.println("* " + s + "<br>");
        //}
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                    throws IOException, ServletException {
       request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}
