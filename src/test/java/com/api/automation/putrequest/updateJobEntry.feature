Feature: To test the updation of Job Entry in the test application
  Test the end point PUT /normal/webapi/update

  Background: Create and initialize base URL
    Given url "http://localhost:9191"

  Scenario: To update the job entry for exiting job in JSON format
    # Create new Job Entry
    Given path "/normal/webapi/add"
    * def getRandomValue = function () { return Math.floor(100 * Math.random());}
    * def jobId = getRandomValue()
    * def req = {"jobId": "#(jobId)","jobTitle": "Software Engg - 2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    # PUT Request
    Given path "/normal/webapi/update"
    And request {"jobId": "#(jobId)","jobTitle": "Software Engg - 3","jobDescription": "To develop andriod application and web app","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,`$[?(@.jobId == ${jobId})].project`)
    And print projectArray[0]
    And match projectArray[0] == "#[1]"

  Scenario: To update the job entry for exiting job in JSON format
    # Create new Job Entry
    Given path "/normal/webapi/add"
    * def getRandomValue = function () { return Math.floor(100 * Math.random());}
    * def jobId = getRandomValue()
    * def req = {"jobId": "#(jobId)","jobTitle": "Software Engg - 2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    # PUT Request
    Given path "/normal/webapi/update"
    And request {"jobId": "#(jobId)","jobTitle": "Software Engg - 3","jobDescription": "To develop andriod application and web app","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,`$[?(@.jobId == ${jobId})].project`)


  Scenario: To update the job entry for exiting job in JSON format by calling another feature file
    # Create new Job Entry
    # <Gherkin keyword> <call> <read(<location of file>)>
    Given call read("../createJobEntry.feature")
    # PUT Request
    * def jobId = 125
    Given path "/normal/webapi/update"
    And request {"jobId": "#(jobId)","jobTitle": "Software Engg - 3","jobDescription": "To develop andriod application and web app","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 404
    * def projectArray = karate.jsonPath(response,`$[?(@.jobId == ${jobId})].project`)
    And print projectArray

  Scenario: To update the job entry for exiting job in JSON format by calling another feature file using shared context
    # Create new Job Entry
    # <Gherkin keyword> <call> <read(<location of file>)>
    # Shared context store result
    # Given call read("../createJobEntry.feature") {var1: value1, var2: value2}
    * def postRequest = call read("../createJobEntry.feature")
    And print "Calling Feature ==> ", postRequest.jobId
    And print "Calling Feature ==> ", postRequest.getRandomValue()
    # PUT Request
    Given path "/normal/webapi/update"
    And request {"jobId": "#(postRequest.jobId)","jobTitle": "Software Engg - 3","jobDescription": "To develop andriod application and web app","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,`$[?(@.jobId == ${postRequest.jobId})].project`)

  Scenario: To update the job entry for exiting job in JSON format by calling another feature file with variables
    # <Gherkin keyword> <call> <read(<location of file>)>
    # Given call read("../createJobEntry.feature") {var1: value1, var2: value2}
    * def getRandomValue = function () { return Math.floor(100 * Math.random());}
    * def jobId = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature") { _url: "http://localhost:9191", _path: "/normal/webapi/add", _jobId: "#(jobId)"}
        # PUT Request
    Given path "/normal/webapi/update"
    And request {"jobId": "#(postRequest.jobId)","jobTitle": "Software Engg - 3","jobDescription": "To develop andriod application and web app","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,`$[?(@.jobId == ${postRequest.jobId})].project`)
