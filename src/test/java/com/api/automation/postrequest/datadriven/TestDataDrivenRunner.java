package com.api.automation.postrequest.datadriven;

import com.intuit.karate.junit5.Karate;

public class TestDataDrivenRunner {
    @Karate.Test
    Karate runTest() {
        return Karate.run("postDataDriven").relativeTo(getClass());
    }
}
