package com.api.automation.getrequest.queryparams;

import com.intuit.karate.junit5.Karate;

public class TestQueryParameterRunner {
    @Karate.Test
    Karate runTest() {
        return Karate.run("queryParameter").relativeTo(getClass());
    }
}
