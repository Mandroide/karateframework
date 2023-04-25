Feature: To create job description in the test application

  Background:
    Given url "http://localhost:9191"
    * def testdata = read("testData.csv")

  Scenario Outline: To create job description in the test application <method>
    Given print '<path>'
    When print '<method>'
    Then print '<status>'

    Examples:
      | path               | method | status |
      | /normal/webapi/all | get    | 200    |
      | /normal/webapi/add | post   | 201    |

  Scenario Outline: Data Driven for the job description entry - <jobId>
    * def req = {"jobId": "#(jobId)","jobTitle": "#(jobTitle)","jobDescription": "#(jobDescription)","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And path "/normal/webapi/add"
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status <status>

    Examples:
      | jobId | jobTitle          | jobDescription                 | status
      | 9980  | Software Engg - 2 | To develop andriod application | 201
      | id    | Software Engg - 2 | To develop andriod application | 400
      | false | Software Engg - 2 | To develop andriod application | 400

  Scenario Outline: Data Driven for the job description entry using csv files - <jobId>
    * def req = {"jobId": "#(jobId)","jobTitle": "#(jobTitle)","jobDescription": "#(jobDescription)","experience": ["Google","Apple","Mobile Iron","Pega"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And path "/normal/webapi/add"
    And request req
    And headers {Accept: "application/json", Content-Type: "application/json"}
    When method post
    And status <status>

    Examples:
      #| testdata             |
      | read("testData.csv") |