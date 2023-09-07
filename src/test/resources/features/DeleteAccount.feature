# we have to figure out two things frist: Account should be exist to delete. 200 status code
#Make sure Account that is not exist to get 404 Status code.
#I need to do two call one to generate token, the other one to generate an account.
@Regression
Feature: Delete Account functionality

  Background: Test Setup and Create New Account.
    * def createAccount = callonce read('CreateAccount.feature')
    * def validToken = createAccount.validToken
    * def createdAccountId = createAccount.response.id
    And print createAccount
    Given url "https://tek-insurance-api.azurewebsites.net"
    

  Scenario: Successfull delete account
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    And header Authorization = "Bearer " + validToken
    When method delete
    Then status 200
    And assert response == "Account Successfully deleted"
    #After asserting we are sending another request
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    #After we make sure that is deleted we are sending annother one. and header Authorization and just need copy and past the steps.
    And header Authorization = "Bearer " + validToken
    When method delete
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id " + createdAccountId + " not exist"
