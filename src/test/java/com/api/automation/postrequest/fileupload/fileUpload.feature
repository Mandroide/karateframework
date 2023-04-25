Feature:  To upload the file using the Karate framework
  Background: Setup the Base Path
    Given url "http://localhost:9191"

  Scenario: To upload the in the test application
    Given path "/normal/webapi/upload"
    # location of file, name of the file, content-type header value
    And multipart file file = { read: "fileToUpload.txt", filename: "fileToUpload.txt", Content-Type: "multipart/form-data"}
    When method post
    Then status 200
    And print response

  Scenario: To upload the in the test application with json data
    Given path "/normal/webapi/upload"
    # location of file, name of the file, content-type header value
    * def fileLocation = "../data/request.json"
    And multipart file file = { read: "#(fileLocation)", filename: "request.json", Content-Type: "multipart/form-data"}
    When method post
    Then status 200
    And print response
    And match response.message contains "request.json"