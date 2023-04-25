@Regression @Confidence
Feature: To test the Get endpoint with Query Parameter
  GET /normal/webapi/find

  Background: Create and Initialize base URL
    Given url "http://localhost:9191"

  Scenario: To get the data using Query Parameter
    # Create the Job Entry
    # Get the newly created Job Entry using Query Param
    * def getRandomValue = function() { return Math.floor(100 * Math.random()); }
    * def jobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "http://localhost:9191", _path: "/normal/webapi/add", _jobId: #(jobId)}
    # Send the Get request with query param
    Given path  "/normal/webapi/find"
    #And param id = jobId
    #And param jobTitle = "Software Engg - 2"
    And params {id: "#(jobId)", jobTitle: "Software Engg - 2"}
    And headers {Accept: "application/json"}
    When method get
    Then status 200
    And match $.jobId == jobId

  Scenario: To get the data using Query Parameter with JobId not in the application
    # Create the Job Entry
    # Get the newly created Job Entry using Query Param
    * def getRandomValue = function() { return Math.floor(100 * Math.random()); }
    * def jobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "http://localhost:9191", _path: "/normal/webapi/add", _jobId: #(jobId)}
    # Send the Get request with query param
    Given path  "/normal/webapi/find"
    And param id = -jobId
    And param jobTitle = "Software Engg - 2"
    And headers {Accept: "application/json"}
    When method get
    Then status 404