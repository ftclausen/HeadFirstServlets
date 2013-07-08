package com.example;
import java.util.*;

public class MyBean {
    private java.util.Map<String, String> params = new HashMap<String, String>();
    private java.util.List<String> objects = new ArrayList<String>();
    private String name;

    public void setThings() {
        params.put("key1", "value1");
        params.put("key2", "value2");
        objects.add("one");
        objects.add("two");
        name = "Fred";
    }
    public java.util.Map<String, String> getParams() { return params; }
    public java.util.List<String> getObjects() { return objects; }
    public String getName() { return name; }
}
