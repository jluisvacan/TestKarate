Feature: To get the variables set by Karate-config.js file

  Background: To get value of myName
    * def localMyVarName = myVarName
    Given print "Background Variable value ==> ", localMyVarName


  Scenario: To get value of userName and password from Karate-config.js file
    * def localUsername = username
    Given print "Scenario Variable value ==> ", localUsername
    And print "Scenario Variable value ==> ", password