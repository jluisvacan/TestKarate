Feature: To test the updation of job entry in the test application

  Background: Create and Initialize base url
    Given url 'http://localhost:9897'

  Scenario: To update the Job entry for existing job in JSON format
    #Create a new Job entry
    #Update the Job Entry using PUT request
    #Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId":'#(id)',"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
    """
    {"jobId":'#(id)',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application and Web App","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    """
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ id + ")].project")
    And print "project array ==> ",projectArray
    And match projectArray[0] == '#[2]'


  Scenario: To update the Job entry for non-existing job in JSON format
    #Create a new Job entry
    #Update the Job Entry using PUT request
    #Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    And request {"jobId":'#(id)',"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {"jobId":'#(getRandomValue())',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application and Web App","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
      """
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method put
    Then status 404


  Scenario: To update the Job entry for existing job in JSON format by calling another feature file
    #Call another feature file
    # <Gherkin keyword> <call> <read(<location of file>)>
    Given call read("../createJobEntry.feature")
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {"jobId":125,"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application and Web App","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
      """
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
    And print "project array ==> ",projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update the Job entry for existing job in JSON format by calling another feature file using shared context
    #Call another feature file
    # <Gherkin keyword> <call> <read(<location of file>)>
    * def postRequest = call read("../createJobEntry.feature")
    And print "Calling Feature ===> ", postRequest.id
    And print "Calling Feature ===> ", postRequest.getRandomValue()
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {"jobId":'#(postRequest.id)',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application and Web App","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]},{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
      """
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.id + ")].project")
    And print "project array ==> ",projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update the Job entry for existing job in JSON format by calling another feature file with variables
    # <Gherkin keyword> <call> <read(<location of file>)>
    # Given call read("../createJobEntry.feature") {car.value, var2.valueo}
    * def getRandomValue = function() {return Math.floor((100)*Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(id)'}