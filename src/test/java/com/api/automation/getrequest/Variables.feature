Feature: Variable Creation in Karate Framework

  Background: Create and Initialize Variable
    * def app_name = "Google"
    * def page_load_timeout = 20

  # <Gherkin Keyword> <def> <Variable_name> = <value>
  # * <def> <variable_name> = <value>
  Scenario: To create a variable
    # Use variable for repeating value
    # Storing the data from an external file
    # In the matcher expression
    # Passing the Data from one feature file to another

    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int Variable ==> ", var_int
    And print "String Variable ==> ", var_string
    * def var_int2 = var_int + 10
    And print "New Variable ==> ", var_int2
    And print "Background Section Variable ==> ", app_name, "=", page_load_timeout

    Scenario: Access the variable
      * def var_int = 1
      * def var_string = "New"
      * def var_int2 = var_int + 90
      Given print "Previous Scenario ==> ", var_int
      And print "Previous Scenario", var_string
      And print "Previous Scenario", var_int2
      And print "Background Section Variable ==> ", app_name, "=", page_load_timeout
