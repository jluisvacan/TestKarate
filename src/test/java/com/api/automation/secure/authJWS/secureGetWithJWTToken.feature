Feature: To send the get request with JWT token
  GET http://localhost:9897/auth/webapi/all

  Scenario: Send the GET request with JWT token
    * def token = call read('getToken.feature') {username:'Mark Stalon',password:'Pass123'}
    * print "Auth token ===> ",token.authToken
    Given url 'http://localhost:9897/auth/webapi/all'
    And headers {Accept:'application/json',Authorization:'#("Bearer " + token.authToken)'}
    When method get
    Then status 200


  Scenario: Send the GET request without JWT token
    Given url 'http://localhost:9897/auth/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401