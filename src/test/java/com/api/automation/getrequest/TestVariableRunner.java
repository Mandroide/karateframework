package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;

class TestVariableRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("Variables").relativeTo(getClass());
    }
}
