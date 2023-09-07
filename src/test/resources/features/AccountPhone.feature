#Scenario 12 create using scenario 10.scenario 10 is one create a new account and add using the API account add account phone at a phone record?
#frist to call this create account call create an account.
@Regression
Feature: Create Account and Add Phone Number

  Background: Setup Test and Create Account
   Given url "https://tek-insurance-api.azurewebsites.net"
    * def createAccountResult = callonce read('CreateAccount.feature')
    And print createAccountResult
    * def validToken = createAccountResult.validToken
    * def createdAccountId = createAccountResult.response.id

  Scenario: Adding Phone number to an Account
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = createdAccountId
    And header Authorization = "Bearer " + validToken
    * def dataGenerator = Java.type('api.utility.data.GenerateData')
    * def phoneNumber = dataGenerator.getPhoneNumber()
    And request
      """
      {
      "phoneNumber": "#(phoneNumber)",
      "phoneExtension": "Night",
      "phoneTime": "",
      "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And assert response.phoneNumber == phoneNumber
