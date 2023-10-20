Feature: Deleting account
  Scenario: Delete an account by karate
    Given url "https://qa.insurance-api.tekschool-students.com"
    Given path "/api/accounts/delete-account"
    * def tokenCall = callonce read('APIToken.feature')
    * def token = tokenCall.response.token
    And print token
    And param primaryPersonId = 906

    And header authorization = "Bearer " + token
    When method delete
    Then status 200
