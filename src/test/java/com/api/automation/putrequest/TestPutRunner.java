package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;

public class TestPutRunner {

    @Karate.Test
    Karate runTest() {
        return Karate.run("updateJobEntry").relativeTo(getClass());
    }
}
