Feature: To Execute the Java Script Function

  Scenario: Execute Java Script function with and without parameter
  * def getIntValue = function() {return 10;}
  Then print "Function getIntValue ===> ", getIntValue()
  * def getRandomValue = function() {return Math.floor((100)*Math.random());}
  Then print "Function getRandomValue ===> ", getRandomValue()
  * def getStringValue = function(arg1) {return "Hello " + arg1;}
  Then print "Function getStringValue ===> ", getStringValue("world!")