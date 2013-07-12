package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AllTheThings extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws IOException, ServletException {
        String tip = request.getParameter("tip");
        if (tip.equalsIgnoreCase("")) {
            System.out.println("WARN: Setting tip to standard value, none given.");
            tip = "No Tip <b>given!!</b>";
        } 
        request.setAttribute("tip", tip);
        RequestDispatcher view = request.getRequestDispatcher("ShowAllTheThings.jsp");
        view.forward(request, response);
    }
}
