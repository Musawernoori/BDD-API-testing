Feature: Add phone number
  Scenario: Test the primary-phone-number with karate
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/accounts/add-account-phone"
    * def token = callonce read('APIToken.feature')
    * def tokenCall = token.response.token
    And print tokenCall
    Given param primaryPersonId = 890
    And header authorization = "Bearer " + tokenCall

    And request
    """
    {
  "phoneNumber": "5714660834",
  "phoneExtension": "751",
  "phoneTime": "+1",
  "phoneType": "cellphone"
}
    """
    When method post
    Then status 201
    And print response