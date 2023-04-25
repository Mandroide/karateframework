package com.api.automation;

import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ParallelBuilderWithCucumberReport {

    @Test
    public void executeKarateTest() {
        var results = Runner.path("classpath:com/api/automation").parallel(5);
        generateCucumberReport(results.getReportDir());
        System.out.printf("Total Features => %d\n", results.getFeaturesTotal());
        System.out.printf("Passed Features => %d\n", results.getFeaturesPassed());
        System.out.printf("Total Scenarios => %d\n", results.getScenariosTotal());
        System.out.printf("Passed Scenarios => %d\n", results.getScenariosPassed());
        int expected = 0;
        assertEquals(expected, results.getFailCount(), "There are some failed scenario");
    }

    // reportDirLocation --> target/surefire-reports
    private void generateCucumberReport(String reportDirLocation) {
        // Get Absolute paths of JSON outputs from Runner
        File reportOutputDirectory = new File(reportDirLocation);
        var listedFiles = FileUtils.listFiles(reportOutputDirectory, new String[]{"karate-json.txt"}, true);
        List<String> jsonFiles = new ArrayList<>();
        listedFiles.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
//net.masterthought.cucumber.ValidationException: File
        // Create a configuration with reportOutputDirectory and projectName for report builder
        var configuration = new Configuration(reportOutputDirectory, "Run Karate");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        reportBuilder.generateReports();
    }
}
