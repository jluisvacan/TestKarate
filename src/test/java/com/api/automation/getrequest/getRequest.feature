Feature: To test the get end point of the application
  To test different get end point with different data formate supported by the application

  Background: Setup the Base path
  Given url 'http://localhost:9897'
  And print '============ This is background keyboard ============'

  Scenario: To get  all the data from application in JSON format
    #Base Path + Context path
    #Given url 'http://localhost:9897/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method get #Send the get request
    #The status code responde should be 200
    Then status 200


  Scenario: To get  all the data from application in JSON format using path
    #Base Path
    ##Given url 'http://localhost:9897'
    #Context path
    And path '/normal/webapi/all'
    #Add headers
    And header Accept = 'application/json'
    When method get #Send the get request
    #The status code responde should be 200
    Then status 200


  Scenario: To get  all the data from application in XML format using path
    #Base Path
    ##Given url 'http://localhost:9897'
    #Context path
    And path '/normal/webapi/all'
    #Add headers
    And header Accept = 'application/xml'
    When method get #Send the get request
    #The status code responde should be 200
    Then status 200