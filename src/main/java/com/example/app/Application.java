package com.example.app;

public class Application {
    private final String name;
    private final String version;

    public Application(String name, String version) {
        this.name = name;
        this.version = version;
    }

    public String getName() {
        return name;
    }

    public String getVersion() {
        return version;
    }

    public static void main(String[] args) {
        Application app = new Application("MyApp", "1.0");
        System.out.println("Application Name: " + app.getName());
        System.out.println("Application Version: " + app.getVersion());
    }
}