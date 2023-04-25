Feature: To create the job entry in the application
  Use POST /normal/webapi/add to create job entry in the application

  Background: Create and initialize base url
    Given url "http://localhost:9191"

  Scenario: To create the Job Entry in JSON format
    Given path "/normal/webapi/add"
    * def req = read("data/request.json")
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg - 2"

  Scenario: To create the Job Entry in XML format
    Given path "/normal/webapi/add"
    * def req = read("data/request.xml")
    And request req
    And headers {Accept: "application/json", Content-Type: "application/xml"}
    When method post
    And status 201
    And print response
    And match /jobId == "7"

  Scenario: To create the Job Entry in XML format
    Given path "/normal/webapi/add"
    * def req = read("data/request.xml")
    And request req
    And headers {Accept: "application/xml", Content-Type: "application/xml"}
    When method post
    And status 201
    And print response
    And match /Job/jobId == "7"

  Scenario: To create the Job Entry in JSON format with embedded expression
    Given path "/normal/webapi/add"
    * def getJobId = function() {return Math.floor(100 * Math.random());}
    * def req = read("data/requestWithVariable.json")
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg - 2"

  Scenario: To create the Job Entry in XML format with embedded expression
    Given path "/normal/webapi/add"
    * def getJobId = function() {return Math.floor(100 * Math.random()).toString();}
    * def jobId = getJobId()
    * def req = read("data/requestWithVariable.xml")
    And request req
    And headers {Accept: "application/xml", Content-Type: "application/xml"}
    When method post
    And status 201
    And print response
    And match /Job/jobId == "#(jobId)"
