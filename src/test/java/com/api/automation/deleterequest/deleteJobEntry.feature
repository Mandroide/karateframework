Feature: To test the delete endpoint
  DELETE /normal/webapi/remove/{id}

  Background: Create and initialize base URL
    * def baseUrl = "http://localhost:9191"
    Given url baseUrl

  Scenario: To delete the job entry from application using job id
    # Create a new Job entry
    # Delete the newly created job entry
    # Get request with query parameter and validate for 404
    * def getRandomValue = function () {return Math.floor(100 * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "#(baseUrl)", _path: "/normal/webapi/add", _jobId: "#(createJobId)"}
    # delete request
    Given path `/normal/webapi/remove/${createJob.jobId}`
    And header Accept = "application/json"
    When method delete
    Then status 200
    # Get Request
    Given path "/normal/webapi/find"
    And params {id: "#(createJob.jobId)", jobTitle: "#(createJob.jobTitle)"}
    And header Accept = "application/json"
    When method get
    Then status 404

  Scenario: To delete the job entry from application using job id and job entry twice
    # Create a new Job entry
    # Delete the newly created job entry
    # Get request with query parameter and validate for 404
    * def getRandomValue = function () {return Math.floor(100 * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "#(baseUrl)", _path: "/normal/webapi/add", _jobId: "#(createJobId)"}
    # delete request
    Given path `/normal/webapi/remove/${createJob.jobId}`
    And header Accept = "application/json"
    When method delete
    Then status 200
    When method delete
    Then status 404

  Scenario: To demo request chaining
    # Create new jobEntry
    # Extract the job id and job title from the response of POST request
    # Send the patch request, Value of query parameter will be set by, info extracted from previous request
    # Extract the job id and job title from the response of patch request
    # Get request with query parameter, value of query param is set by info extracted from response of patch request
    # Add the validation on job description in the response of get request
    * def getRandomValue = function () {return Math.floor(100 * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("../createJobEntryWithVariables.feature") {_url: "#(baseUrl)", _path: "/normal/webapi/add", _jobId: "#(createJobId)"}
    * def jobId = createJob.jobId
    * def jobTitle = createJob.jobTitle

    # Patch Request
    * def jobDes = "To develop andriod application and web application"
    Given path "/normal/webapi/update/details"
    And params {id: "#(jobId)", jobTitle: "#(jobTtitle)", jobDescription: "#(jobDes)"}
    And header Accept = "application/json"
    And request {}
    When method patch
    Then status 200
    * def jobId = $.jobId
    * def jobTitle = $.jobTitle

    # Get request
    Given path "/normal/webapi/find"
    And params {id: "#(jobId)", jobTitle: "#(jobTitle)"}
    And header Accept = "application/json"
    When method get
    Then status 200
    And match $.jobDescription == jobDes