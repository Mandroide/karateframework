Feature: To validate the GET Endpoint response from file
  To validate the get endpoint response from external file

  Background: Setup the base url
    Given url "http://localhost:9191"

  Scenario: Get the data in JSON format and validate from file
    Given path "/normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read("../response.json")
    And match response == actualResponse
    And print "JSON File ==> ", actualResponse

  Scenario: Get the data in XML format
    Given path "/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    # Create the variable to read the data from xml file
    * def actualResponse = read("../response.xml")
    And match response == actualResponse
    And print "XML File ==> ", actualResponse
