Feature: To test the GET end point with Query Parameters
  GET /normal/wrb/api/find

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: To get the data using Query Parameters
    #Create the Job entry
    #Get the newly created Job Entry using Query param
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Send the GET request with query param
    Given path '/normal/webapi/find'
    #And param id = createJobId
    #And param jobTitle = 'Software Engg - 2'
    And params {id: '#(createJobId)', jobTitle: 'Software Engg - 2'}
    And headers {Accept : 'application/json'}
    When method get
    Then status 200
    And match response.jobId == createJobId


  Scenario: To get the data using Query Parameters with JobId not in the application
    #Create the Job entry
    #Get the newly created Job Entry using Query param
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9897',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    #Send the GET request with query param
    Given path '/normal/webapi/find'
    And param id = 1212312441
    And param jobTitle = 'Software Engg - 2'
    #And params {id: '#(createJobId)', jobTitle: 'Software Engg - 2'}
    And headers {Accept : 'application/json'}
    When method get
    Then status 404