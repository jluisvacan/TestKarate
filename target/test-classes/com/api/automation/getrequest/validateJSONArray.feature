Feature: To validate the GET End point
  To validate the get end point response

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: The get data in JSON format and validate values
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    #Validate specific value of parameter
    And match response[0].jobId == 1
    And match response[0].experience[1] == 'Apple'
    And match response[0].project[0].projectName == 'Movie App'
    And match response[0].project[0].technology[2] == 'Gradle'
    #Validate the size array of parameter
    And match response[0].experience == '#[3]'
    And match response[0].project[0].technology == '#[3]'
    #Validate all content of parameter
    And match response[0].experience[*] == ["Google", "Apple", "Mobile Iron"]
    And match response[0].project[0].technology[*] contains ["Kotlin", "SQL Lite", "Gradle"]
    #Validate that parameter contins value(s)
    And match response[0].project[0].technology[*] contains ["SQL Lite", "Gradle"]
    And match response[*].jobId contains 1

  Scenario: The get data in JSON format and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    #Validata that property is present
    And match response[0].jobId == '#present'
    #Validata that property is not null
    And match response[0].experience[1] == '#notnull'
    #Ignore property
    And match response[0].project[0].projectName == '#ignore'
    #Validata that property is array
    And match response[0].project[0].technology == '#array'
    #Validate that property is a string
    And match response[0].jobTitle == '#string'
    #Validate that property is a number
    And match response[0].jobId == '#number'
    #Complex fuzzy matcher, expression in JS
    And match response[0].jobId == '#? _ == 1'
    And match response[0].jobId == '#? _ != 2'
    And match response[0].jobId == '#? _ >= 1'
    #Validate specific property
    And match response[0].jobTitle == '#string? _.length >= 1'
    #To validate the array
    And match response[0].experience == '#[]'
    And match response[0].experience == '#[3]'
    #Make sure it is a array of string
    And match response[0].experience == '#[3] #string'
    And match response[0].experience == '#[] #string'
    And match response[0].experience == '#[3] #string? _.length >= 2'

