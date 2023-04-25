Feature: To test the get endpoint of the application
  To test different get endpoints with different data format supported by the application

  Background: Setup the Base path
    Given url "http://localhost:9191"

  Scenario: To get all the data from application in JSON format using path variable
    #Given url "http://localhost:9191"
    And path "/normal/webapi/all"
    And header Accept = "application/json"
    #Base Path + Context path
    When method get #Send the get request
    Then status 200 # the status code response should be 200
    And match $.[0].jobId == 1
    And match $.[0].experience[1] == 'Apple'
    And match $.[0].project[0].projectName == 'Movie App'
    And match $.[0].project[0].technology[2] == 'Gradle'
    # validate the size of array
    And match $.[0].experience == '#[3]'
    And match $.[0].project[0].technology == '#[3]'
    # Using wild card character
    And match $.[0].experience[*] == ['Google', 'Apple', 'Mobile Iron']
    And match $.[0].project[0].technology[*] == ['Kotlin', 'SQL Lite', 'Gradle']
    # Contains keyword
    And match $.[0].experience[*] contains ['Google', 'Apple', 'Mobile Iron']
    And match $.[0].project[0].technology[*] contains ['Kotlin', 'SQL Lite', 'Gradle']
    And match $.[*].jobId contains 1

  Scenario: To get all the data from application in JSON format and validate using fuzzy matcher
    #Given url "http://localhost:9191"
    And path "/normal/webapi/all"
    And header Accept = "application/json"
    #Base Path + Context path
    When method get #Send the get request
    Then status 200 # the status code response should be 200
    And match $.[0].jobId == '#present'
    And match $.[0].experience[1] == '#notnull'
    And match $.[0].project[0].projectName == '#ignore'
    And match $.[0].project[0].technology == '#array'
    And match $.[0].jobTitle == '#string'
    And match $.[0].jobId == '#number'
    # Complex Fuzzy matcher
    # '_' symbol is called as "self" variable. Whenever is a JS expression  is used
    And match $.[0].jobId == '#? _ >= 1'
    And match $.[0].jobTitle == '#string? _.length == 13'
    # To validate the array
    And match $.[0].experience == "#[]"
    And match $.[0].experience == "#[3]"
    # Make sure is an array of strings
    And match $.[0].experience == "#[3] #string"
    And match $.[0].experience == "#[3] #string? _.length >= 2"
