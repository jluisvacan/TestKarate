package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {
    @Karate.Test
    public Karate runTest() {
       return Karate.run("getRequest", "responseMatcher", "validateJSONArray", "validateXMLResponse").relativeTo(getClass());

    }

    @Karate.Test
    public Karate runTestUsingClassPath() {
        return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
    }
}
