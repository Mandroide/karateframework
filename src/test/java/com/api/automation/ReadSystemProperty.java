package com.api.automation;

public class ReadSystemProperty {

    public static void main(String[] args) {
        System.getProperty("karate_tags");
        System.out.printf("Location %s%n", System.getProperty("location", "com/api/automation"));
        System.out.printf("Tags %s%n%n", System.getProperty("tags", "@Confidence"));

    }
}
