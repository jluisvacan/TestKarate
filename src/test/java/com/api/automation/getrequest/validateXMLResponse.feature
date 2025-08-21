Feature: To validate the GET End point
To validate the get end point response

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: The get data in XML format and validate values
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    #Validate specific value of parameter
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    #Skip the response keyword
    And match /List/item/experience/experience[1] == 'Google'
    #Travers the xml similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'

  Scenario: The get data in XML format and validate values
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    ##Validata that property is not null
    And match response/List/item/jobId == '#notnull'
    #Validata that property is string
    And match response/List/item/jobTitle == '#string'
    #Validata that property is present
    And match response/List/item/project/project/projectName == '#present'
    #Validata that property is an array
    And match response/List/item/experience/experience == '#array'
    ##Ignore property
    And match response/List/item/project/project/technology/technology[2] == '#ignore'
    #Validate property with fuzzy matcher
    And match response/List/item/jobTitle == '#string? _.length >= 1'
    #Validate that property isn't present
    And match response/List/item/jobTitle.id == '#notpresent'