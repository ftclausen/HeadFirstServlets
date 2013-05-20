package com.example;
import java.util.*;

public class HobbyModel {
    public List<String> getHobbyCohorts(String hobby) {
        List<String> names = new ArrayList<String>();
        if (hobby.equalsIgnoreCase("climbing")) {
            names.add("Jan");
            names.add("Jorrit");
            names.add("Jasper");
            names.add("Erwin");
            names.add("Jaap");
        }
        if (hobby.equalsIgnoreCase("yoga")) {
            names.add("Jata");
            names.add("Amelie");
            names.add("Marilyn");
        }
        if (hobby.equalsIgnoreCase("cycling")) {
            names.add("Jata");
            names.add("Most of Amsterdam");
        }
        return(names);
    }
}
