Feature: To access the GET end point wich is secure with Basic Auth
  GET secure/webapi/all

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To access the GET end point with bassic Auth
  Given path 'secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response == '#notnull'


  Scenario: To access the GET end point without bassic Auth
    Given path 'secure/webapi/all'
    And headers {Accept:'application/json',}
    When method get
    Then status 401
    And match response == '#notnull'


  Scenario: To access the GET end point with non-existing user
    Given path 'secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YXV0aG9yOndlbGNvbWUx'}
    When method get
    Then status 401


  Scenario: To access the GET end point with bassic Auth via js funciton
    Given path 'secure/webapi/all'
    * def auth = call read('basicAuth.js') {username:'admin',password:'welcome'}
    And print "Encode string ===> ", auth
    And headers {Accept:'application/json', Authorization:'#(auth)'}
    When method get
    Then status 200
    And match response == '#notnull'