package com.api.automation.getrequest.ignore;

import com.intuit.karate.junit5.Karate;

public class TestGetRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("getRequest", "responseMatcher")
                .tags("~@ignore")
                .relativeTo(getClass());
    }

}
