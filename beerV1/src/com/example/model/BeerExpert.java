package com.example.model;
import java.util.*;

public class BeerExpert {
    public List<String> getBrands(String color) {
        List<String> brands = new ArrayList<String>();
        if (color.equals("blonde")) {
            brands.add("Leffe Blonde");
            brands.add("Chimay Blond");
            brands.add("Karmaliet Bier");
            brands.add("Westmalle");
        } else {
            brands.add("Amstel");
            brands.add("Heineken");
        }
        return(brands);
    }
}
