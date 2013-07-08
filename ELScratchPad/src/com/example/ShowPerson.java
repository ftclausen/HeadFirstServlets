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

        Map<String, String> musicMap = new HashMap();
        musicMap.put("Ambient", "Zero 7");
        musicMap.put("Surf", "Tahiti 80");
        request.setAttribute("musicMap", musicMap);
        String[] genreList = {"Surf", "Ambient"};
        request.setAttribute("genres", genreList);
        request.setAttribute("person", p);
        MyBean mb = new MyBean();
        mb.setThings();
        request.setAttribute("mybean", mb);

        Person p2 = new Person();
        p2.setName("Leelu");
        Dog d = new Dog();
        d.setName("Clyde");
        Toy t1 = new Toy();
        t1.setName("stick");
        Toy t2 = new Toy();
        t2.setName("neighbour's cat");
        Toy t3 = new Toy();
        t3.setName("Barbie Doll's head");
        d.setToys(new Toy[] { t1, t2, t3 });
        p2.setDog(d);
        request.setAttribute("person", p2);
        
        RequestDispatcher view = request.getRequestDispatcher("ELTest.jsp");
        view.forward(request, response);
    }
}
