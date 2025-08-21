package com.api.automation.secure.authJWS;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestSecureJWTRunner {
    @Test
    public Karate runTest() {
       return Karate.run("getToken","secureGetWithJWTToken").relativeTo(getClass());
    }

}
