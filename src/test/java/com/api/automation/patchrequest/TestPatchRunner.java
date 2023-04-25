package com.api.automation.patchrequest;

import com.intuit.karate.junit5.Karate;

public class TestPatchRunner {
    @Karate.Test
    Karate runTest() {
        return Karate.run("updateJobDescription").relativeTo(getClass());
    }
}
