  # @<user-define-keyword>
@Confidence
Feature: To create the job entry in the application
  Use POST /normal/webappi/add to create entry in the application

  Background: Create and Initialize base URL
  Given url 'http://localhost:9897'

  Scenario: To create the job Entry in JSON format
  Given path '/normal/webapi/add'
  And request {"jobId":1,"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
  And headers {Accept : 'application/json', Content-Type : 'application/json'}
  When method post
  And status 201
  And print response
  And match response.jobTitle == 'Software Engg - 2'


  Scenario: To create the job Entry in XML format
  Given path '/normal/webapi/add'
  And headers {Accept : 'application/json', Content-Type : 'application/xml'}
  And request <item><jobId>8</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
  When method post
  And status 201
  And print response
  And match response.jobId == 8

  Scenario: To create the job Entry in XML format
  Given path '/normal/webapi/add'
  And request <item><jobId>5</jobId><jobTitle>Software Engg - 3</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
  And headers {Accept : 'application/xml', Content-Type : 'application/xml'}
  When method post
  And status 201
  And print response
  And match response/Job/jobId == '5'

  Scenario: To create the job Entry in JSON format with a file
    Given path '/normal/webapi/add'
    * def body = read("data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == 'Software Engg - 4'

  Scenario: To create the job Entry in XML format with a file
    Given path '/normal/webapi/add'
    * def bodyXML = read("data/jobEntry.xml")
    And request bodyXML
    And headers {Accept : 'application/xml', Content-Type : 'application/xml'}
    When method post
    And status 201
    And print response
    And match response/Job/jobId == '6'



  Scenario: To create the job Entry in JSON format with embedded expression
    Given path '/normal/webapi/add'
    * def getJobID = function() {return Math.floor((100)*Math.random());}
    And request {"jobId": '#(getJobID())',"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == 'Software Engg - 2'


  Scenario: To create the job Entry in XML format with embedded expression
    Given path '/normal/webapi/add'
    * def getJobID = function() {return Math.floor((100)*Math.random());}
    * def jobID = getJobID()
    And request <item><jobId>#(jobID)</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
    And headers {Accept : 'application/json', Content-Type : 'application/xml'}
    When method post
    And status 201
    And print response
    And match response.jobId == '#(jobID)'