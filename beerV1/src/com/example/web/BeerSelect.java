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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Beer Selection Advice<br><br>");
        String c = request.getParameter("color");
        
        BeerExpert beerTips = new BeerExpert();
        List<String> brands = beerTips.getBrands(c);

        for (String s: brands) {
            out.println("* " + s + "<br>");
        }
    }
}
