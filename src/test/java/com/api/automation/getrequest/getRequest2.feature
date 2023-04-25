Feature: To test the get endpoint of the application
  To test different get endpoints with different data format supported by the application

  Scenario: To test the get endpoint with JSON data
    Given the application url "www.google.com"
    And the context path is "/getdata"
    When I send the get request
    Then status code should be 200
    And the response formt should be in JSON

    Scenario: To test the get endpoint with xml data
      Given the application url "www.google.com"
      And the context path is "/getdata"
      When I send the get request
      Then status code should be 200
      And the response formt should be in JSON