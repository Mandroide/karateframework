package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;

public class TestValidationWithFile {

    @Karate.Test
    public Karate runTest() {
        return Karate.run("ValidationUsingFile").relativeTo(getClass());
    }
}
