package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelRunner {

    @Test
    public void executeKarateTests() {
        //Runner.path("classpath:com/api/automation")
        //        .parallel(5);
        //Runner.Builder aRunner =new Runner.Builder<>();
        //aRunner.path("classpath:com/api/automation");

        //Results result = aRunner.parallel(5);
        Results result = Runner.path("classpath:com/api/automation")
                .parallel(5);
        System.out.println("Total Feature ==> " + result.getFeaturesTotal());
        System.out.println("Total Scenarios ==> " + result.getScenariosTotal());
        System.out.println("Passed Scenarios ==> " + result.getScenariosPassed());

        Assertions.assertEquals(0, result.getScenariosFailed(), "There are Some Failed Scenarios ");
    }
}
