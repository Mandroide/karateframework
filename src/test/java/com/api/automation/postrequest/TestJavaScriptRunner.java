package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;

public class TestJavaScriptRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("javaScriptExecutor").relativeTo(getClass());
    }
}
