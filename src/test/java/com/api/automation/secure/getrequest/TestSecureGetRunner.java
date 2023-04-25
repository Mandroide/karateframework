package com.api.automation.secure.getrequest;

import com.intuit.karate.junit5.Karate;

public class TestSecureGetRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("secureGetRequest", "secureGetWithJWTToken").relativeTo(getClass());
    }

}
