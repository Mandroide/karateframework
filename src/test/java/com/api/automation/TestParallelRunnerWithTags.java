package com.api.automation;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestParallelRunnerWithTags {
    private static final String CLASS_PATH = "classpath:";
    private static final String DELIMITER = ",";
    @Test
    public void executeKarateTests() {
        var results = Runner
//                .path("%scom/api/automation".formatted(CLASS_PATH))
                .path(getLocation())
                .tags(getTags())
                //.tags("@Smoke", "@Regression")
                .parallel(5);
        System.out.printf("Total Features => %d \n", results.getFeaturesTotal());
        System.out.printf("Passed Features => %d \n", results.getFeaturesPassed());
        System.out.printf("Total Scenarios => %d \n", results.getScenariosTotal());
        System.out.printf("Passed Scenarios => %d \n", results.getScenariosPassed());
        int expected = 0;
        assertEquals(expected, results.getFailCount(), "There are some failed scenario");
    }

    // Step 1 - Provide the values for location and tags property. All the values will be separated by ","
    // Read the values, split them using the "," and create a list out of it.
    private List<String> getTags() {
        String aTags = System.getProperty("tags", "@Confidence");
        String[] tags = aTags.split(DELIMITER);
        return List.of(tags);
    }

    private List<String> getLocation() {
        String aLocation = System.getProperty("location", "com/api/automation");
        String[] strings = aLocation.split(DELIMITER);
        return Arrays.stream(strings).parallel().map(location -> CLASS_PATH + location).toList();
    }

//    private List<String> getTags() {
//        String aTags = System.getProperty("tags", "@Confidence");
//        return Arrays.asList(aTags);
//    }
//
//    private List<String> getLocation() {
//        String aLocation = System.getProperty("location", "com/api/automation");
//        return Arrays.asList(CLASS_PATH + aLocation);
//    }
}
