Feature: Validate the JSON schema
  To validate the JSON schema for POST /normal/webapi/add

  Background: Create and Initialize base URL
    Given url 'http://localhost:9897'

  Scenario: To create the job Entry in JSON format
    Given path '/normal/webapi/add'
    And request {"jobId":1,"jobTitle":"Software Engg - 2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron","Pega"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    And print response
    And match response ==
    """
    {
    "jobId": '#number',
    "jobTitle": '#string',
    "jobDescription": '#string',
    "experience": '#[] #string',
    "project": '#[] #object'
    }
    """


  Scenario: Schema Validation for GET end point
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def projectSchema = {"projectName": '#string', 'technology': '#[] #string'}
    * def mainSchema = {"jobId": '#number', "jobTitle": '#string', "jobDescription": '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
    And match response ==
    """
    '#[] ##(mainSchema)'
    """