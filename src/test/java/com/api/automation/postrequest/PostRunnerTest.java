package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;

public class PostRunnerTest {

    @Karate.Test
    public Karate runTest() {
        return Karate.run("createJobEntry", "schemaValidation").relativeTo(getClass());
    }
}
