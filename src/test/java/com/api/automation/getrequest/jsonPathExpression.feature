Feature: To use the JSON path expression

  Background: Setup the Base path
    Given url "http://localhost:9191"
    And print "============ This is Background Keyword =========="

  Scenario: To get the value of property using JSON path expression
    Given path "/normal/webapi/all"
    When method get # Send the get request
    #Then status 201 # the status code response should be 200
    Then status 200 # the status code response should be 200
    # Karate.jsonPath(doc, jsonPathExpression)
    * def jobId = 1
    * def jobTitle = karate.jsonPath(response, `$[?(@.jobId == ${jobId})].jobTitle`)
    * def jobDescription = karate.jsonPath(response, `$[?(@.jobId == ${jobId})].jobDescription`)
    * def experience = karate.jsonPath(response, `$[?(@.jobId == ${jobId})].experience`)
    And print "Job Title ==> ", jobTitle
    And print "Job Description ==> ", jobDescription
    And print "Experience ==> ", experience