@Smoke
Feature: Security Token Tests

  Background: setup test #the background will execute first before the scenario starts
    #any steps that we have is a common steps for all the scenario then we can put that in the background so we are reducing the repetitve work in here.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  Scenario: Generate valid token with valid username and password
    #Prepare request
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

  Scenario Outline: Validate token with invalid username
    And request
      """
      {
      "username": "wrongUsername",
      "password": "tek_supervisor"
      }
      """
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"

    Examples: 
      | username   | password       | errorMessage         |                |
      | wrong      | tek_supervisor |                  400 | User not found |
      | supervisor | wrong          | Password Not Matched |                |

  #for multiple line we can use """ quotes at the beggining and at the end.
  #in karate reponse is a field that hold the actual response come back from the API.

