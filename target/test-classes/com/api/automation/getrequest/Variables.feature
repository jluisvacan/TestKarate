Feature: Variables Creation in Karate framework

  Background: Create and Initialize Variables
  * def app_name = "Google"
  * def page_load_timeout = 20


  #<Gherkin Keyword> <def> <Variable_name> = <Value>
  #* <def> <variable_name> = <value>

  Scenario: To create a Variable
  #Use Variable for reapeting value
  #Storing the data from external file
  #In the matcher expression
  #Passing the data from one feature file to another

  Given def var_int = 10
  And def var_string = "Karate"
  Then print "Int Variable ==> ", var_int
  And print "String Variable ==> ", var_string
  * def var_int_2 = var_int + 10
  And print "New Int Variable ==> ", var_int_2
  * def var_int_3 = var_int_2 + 10
  And print "New Int Variable ==> ", var_int_3
  And print "Backgrund section: App name ==> ", app_name
  And print "Backgrund section: Page load timeout ==> ", page_load_timeout

    #Scope of variable only by scenario
  Scenario: To create a Variable
  * def var_int = 1
  * def var_string = "Framework"
  * def var_int_2 = var_int + 99
  Given print "Previous scenario Int Variable ==> ", var_int
  And print "Previous scenario String Variable ==> ", var_string
  And print "Previous scenario Int Variable ==> ", var_int_2


