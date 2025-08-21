package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ParallelRunnerWithTags {

    private static final String CLASS_PATH ="classpath:";
    private static final String DELIMITER =",";

    @Test
    public void executeKarateTests() {
        //Runner.path("classpath:com/api/automation")
        //        .parallel(5);
        Runner.Builder aRunner =new Runner.Builder<>();
        aRunner.path(getLocation());
        aRunner.tags(getTags());
        aRunner.parallel(5);
    }

    //Step 1 - Provide the values for location and tags property. All the values will be separate by ","
    //Reade the values, split them using the "," and create a list put of it.
    /*private List<String> getTags() {
        String aTags = System.getProperty("tags","@Confidence");
        List<String> aTagList = Arrays.asList(aTags);
        return aTagList;
    }

    private List<String> getLocation() {
        String aLocation = System.getProperty("location","com/api/automation");
        List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
        return aLocationList;
    }*/

    private List<String> getTags(){
        String aTags = System.getProperty("tags","@Confidence");
        List<String> aTagList = Collections.emptyList();
        //Firts check for the delimiter (,)
        //if the aTags has the delimiter then split the string using the delimiter
        //And create the list out of it
        //if aTags does not have delimiter, the use the old logic
        if(aTags.contains(DELIMITER)){
            String tagArray[] = aTags.split(DELIMITER);
            aTagList = Arrays.asList(tagArray);
            return aTagList;
        }
        aTagList = Arrays.asList(aTags);
        return aTagList;
    }


    private List<String> getLocation(){
        String aLocation = System.getProperty("location","com/api/automation");
        List<String> aLocationList = Collections.emptyList();
        if(aLocation.contains(DELIMITER)) {
            String locationArray[] = aLocation.split(DELIMITER);
            aLocationList = Arrays.asList(locationArray);
            aLocationList.replaceAll((entry) -> {
                return CLASS_PATH + entry;
            });
            return aLocationList;
        }

        aLocationList = Arrays.asList(CLASS_PATH + aLocation);
        return aLocationList;
    }

}
