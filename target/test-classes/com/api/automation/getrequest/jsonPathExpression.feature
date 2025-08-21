Feature: To use JSON path expression

  Background: Create and Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To get the value of property using path expression
  Given path 'normal/webapi/all'
  When method get
  Then status 200
    #karate.json(doc, jsonPathExpression)
  * def jobTitle = karate.jsonPath(response, "$[?(@.jobId == 7)].jobTitle")
  * def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 7)].jobDescription")
  * def experience = karate.jsonPath(response, "$[?(@.jobId == 7)].experience")
  And print "Job Title ===> ", jobTitle
  And print "Job Description ===> ", jobDescription
  And print "Experience ===> ", experience
