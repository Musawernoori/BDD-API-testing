Feature: Testing and automatic all the account features from "tek insurance app"

  @US_8
    Scenario: Automating /api/accounts/add-primary-account which create account in tek insurance app database
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/accounts/add-primary-account"
    * def tokenCall = callonce read('GenerateToken.feature')
    * def token = tokenCall.response.token
    Given header authorization = "Bearer " + token
    And request
    """
    {
  "id": 0,
  "email": "yeoMessiisGoat3@gmail.com",
  "firstName": "Leo ",
  "lastName": "Messi",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Soccer player",
  "dateOfBirth": "1987-10-20T20:43:52.983Z",
  "new": true
}
    """
    When method post
    Then status 201
    Then print response


  @US_7
  Scenario: Automating /api/accounts/get-account
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/accounts/get-account"
    * def tokenCall = callonce read('GenerateToken.feature')
    * def token = tokenCall.response.token
    Given print token
    And header authorization = "Bearer " + token
    And param primaryPersonId = 990
    When method get
    Then status 200
    And print response

    @US_9
    Scenario: Automating /api/accounts/get-all-accounts which brings all accounts
      Given url "https://qa.insurance-api.tekschool-students.com"
      Given path "/api/accounts/get-all-accounts"
      * def tokenCall = callonce read('GenerateToken.feature')
      * def token = tokenCall.response.token
      Given header authorization = "Bearer " + token
      When method get
      Then status 200

      @US_10
      Scenario: Automating /api/accounts/delete-account which leads to delete an account
        Given url "https://qa.insurance-api.tekschool-students.com"
        Given path "/api/accounts/delete-account"
        * def tokenCall = callonce read('GenerateToken.feature')
        * def token = tokenCall.response.token
        Given header authorization = "Bearer " + token
        And param primaryPersonId = 990
        When method delete
        Then status 200


        @US_11
        Scenario: Automate /api/accounts/add-account-car which leads to add a car to an account
          Given url "https://qa.insurance-api.tekschool-students.com"
          Given path "/api/accounts/add-account-car"
          * def tokenCall = callonce read('GenerateToken.feature')
          * def token = tokenCall.response.token
          Given header authorization = "Bearer " + token
          And param primaryPersonId = 994
          And request
          """
          {
  "make": "Corolla",
  "model": "Camry",
  "year": "2023",
  "licensePlate": "VA034"
}
          """
          When method post
          Then status 201

  @US_12
  Scenario: Automate  /api/accounts/add-account-phone which add phone number to an account
    Given url "https://qa.insurance-api.tekschool-students.com"
    Given path "/api/accounts/add-account-phone"
    * def tokenCall = callonce read('GenerateToken.feature')
    * def token = tokenCall.response.token
    Given header authorization = "Bearer " + token
    And param primaryPersonId = 994
    And request
    """
    {
  "phoneNumber": "5715770945",
  "phoneExtension": "571",
  "phoneTime": "Eastern",
  "phoneType": "Cell phone"
}
    """
    When method post
    Then status 201










