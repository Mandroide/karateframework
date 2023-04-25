Feature: To create the Job entry in the test application
  Helper file for POST /normal/webapi/all

  Scenario: To create the Job Entry with JSON data
    Given url _url
    And path _path
    And print "Helper ==> ", _url
    And print "Helper ==> ", _path
    * def req = {"jobId": "#(_jobId)","jobTitle": "Software Engg - 2","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status 201
    * def jobId = $.jobId
    * def jobTitle = $.jobTitle