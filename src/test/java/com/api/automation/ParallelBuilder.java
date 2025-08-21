package com.api.automation;

import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;

public class ParallelBuilder {

    @Test
    public void executeKarateTest() {
        Builder aRunner = new Builder();
        aRunner.path("classpath:com/api/automation");
        aRunner.parallel(5);
    }

}
