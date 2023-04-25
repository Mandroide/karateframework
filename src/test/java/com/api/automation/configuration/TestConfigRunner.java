package com.api.automation.configuration;

import com.intuit.karate.junit5.Karate;

public class TestConfigRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("getGlobalConfig").relativeTo(getClass());
    }

}
