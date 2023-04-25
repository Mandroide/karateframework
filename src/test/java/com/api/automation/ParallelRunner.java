package com.api.automation;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ParallelRunner {
    @Test
    public void executeKarateTests() {
        var results = Runner.path("classpath:com/api/automation").parallel(5);
        System.out.printf("Total Features => %d", results.getFeaturesTotal());
        System.out.printf("Passed Features => %d", results.getFeaturesPassed());
        System.out.printf("Total Scenarios => %d", results.getScenariosTotal());
        System.out.printf("Passed Scenarios => %d", results.getScenariosPassed());
        int expected = 0;
        assertEquals(expected, results.getFailCount(), "There are some failed scenario");
    }
}
