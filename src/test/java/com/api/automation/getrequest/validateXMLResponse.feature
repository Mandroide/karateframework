Feature: To test the get endpoint of the application
  To test different get endpoints with different data format supported by the application

  Background: Setup the Base path
    Given url "http://localhost:9191"

  Scenario: To get all the data from application in XML format using path variable
    #Given url "http://localhost:9191"
    And path "/normal/webapi/all"
    And header Accept = "application/xml"
    #Base Path + Context path
    When method get #Send the get request
    Then status 200 # the status code response should be 200
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    # Skip the response keyword
    And match /List/item/experience/experience[1] == 'Google'
    # Travel through xml similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'

  Scenario: To get all the data from application in XML format and validate using fuzzy matcher
    #Given url "http://localhost:9191"
    And path "/normal/webapi/all"
    And header Accept = "application/xml"
    #Base Path + Context path
    When method get #Send the get request
    Then status 200 # the status code response should be 200
    And match response/List/item/jobId == '#notnull'
    And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience == '#array'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[2] == '#ignore'
    And match response/List/item/jobTitle == "#string? _.length == 13"
    And match response/List/item/jobTitle.id == "#notpresent"