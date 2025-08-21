package com.api.automation.getrequest.queryparameters;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParamRunner {
    @Test
    public Karate runTest() {
       return Karate.run("queryParameters").relativeTo(getClass());

    }
}
