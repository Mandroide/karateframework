Feature: To test the patch endpoint for updating the job description

  Background: Create and Initialize base Url
    Given url "http://localhost:9191"

  @Smoke @Regression
  Scenario: To update the job description for newly added job entry
      # Create a new Job Entry
      # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() {return Math.floor(100 * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "http://localhost:9191", _path: "/normal/webapi/add", _jobId: "#(createJobId)"}
    * def jobDes = "To develop andriod application and web application"
      # Patch request
    Given path "/normal/webapi/update/details"
    And params {id: "#(createJobId)", jobTitle: "Software Engg - 2", jobDescription: "#(jobDes)"}
    And header Accept = "application/json"
    When method patch
    Then status 200
    And match $.jobDescription == jobDes

  Scenario: To update the job description for newly added job entry with non-existing jobId
      # Create a new Job Entry
      # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() {return Math.floor(100 * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "http://localhost:9191", _path: "/normal/webapi/add", _jobId: "#(createJobId)"}
    * def jobDes = "To develop andriod application and web application"
      # Patch request
    Given path "/normal/webapi/update/details"
    And params {id: "#(-getRandomValue())", jobTitle: "Software Engg - 2", jobDescription: "#(jobDes)"}
    And header Accept = "application/json"
    When method patch
    Then status 404

  @Smoke @Regression
  Scenario: To update the job description for newly added job entry without jobTitle
      # Create a new Job Entry
      # Using the patch request update the job description of newly added job entry
    * def getRandomValue = function() {return Math.floor(100 * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "http://localhost:9191", _path: "/normal/webapi/add", _jobId: "#(createJobId)"}
    * def jobDes = "To develop andriod application and web application"
      # Patch request
    Given path "/normal/webapi/update/details"
    And params {id: "#(-getRandomValue())", jobDescription: "#(jobDes)"}
    And header Accept = "application/json"
    When method patch
    Then status 400
    And match $.message == "Required String parameter 'jobTitle' is not present"