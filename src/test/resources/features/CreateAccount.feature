@Regression
Feature: Create Account feature

  Background: Setup test and generate toke.
    * def result = callonce read('GenerateToken.feature')
    * def validToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create valid account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + validToken
    #Calling Java class in feature file. utility will create object from Java class.
    * def generateDataObject = Java.type('api.utility.data.GenerateData')
    * def autoEmail = generateDataObject.getEmail()
    And request
      """
      {
      "email": "#(autoEmail)",
        "title": "Mr",
        "firstName": "David",
        "lastName": "Son",
        "gender": "MALE",
        "maritalStatus": "MARRIED",
        "employmentStatus": "student",
        "dateOfBirth": "1998-08-09"
        }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == autoEmail
    #using delete endpoint to remove generate account for continuse execution
  #  Given path "/api/accounts/delete-account"
   # And param primaryPersonId = response.id
    #And header Authorization = "Bearer " + validToken
    #When method delete
    #Then status 200
    #And print response
    #And assert response == "Account Successfully deleted"
