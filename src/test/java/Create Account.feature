Feature: Create an account
  Scenario: Validate creating acount
    Given url "https://qa.insurance-api.tekschool-students.com"
    Given path "/api/accounts/add-primary-account"
    And request
    """
    {
  "id": 0,
  "email": "noori40589@gmail.com",
  "firstName": "Leo messi",
  "lastName": "Ronaldo",
  "title": "MR.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Soccer player",
  "dateOfBirth": "2023-10-19T23:36:45.589Z",
  "new": true
}
    """
    When method post
    Then status 201
