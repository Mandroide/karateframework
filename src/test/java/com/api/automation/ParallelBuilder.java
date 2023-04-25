package com.api.automation;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ParallelBuilder {

    @Test
    public void executeKarateTest() {
        var aRunner = new Runner.Builder<>();
        aRunner.path("classpath:com/api/automation");
        aRunner.parallel(5);
    }
}
