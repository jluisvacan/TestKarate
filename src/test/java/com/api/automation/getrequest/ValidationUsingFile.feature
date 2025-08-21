Feature: To validate the GET End point response from file
To validate the get end point response from external file

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the data in JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    #Create a variable to store the data from external file
    #.. => Parent package
    * def actualResponse = read("../JsonResponse.json")
    #And match response == actualResponse
    And print "File ==> ", actualResponse


    Scenario: Setup To get the data in XML format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    #Create the variable to read the data from XML file
    * def actualResponse = read("../XmlResponse.xml")
    And print "Xml Response ==> ", actualResponse
    And match response == actualResponse
