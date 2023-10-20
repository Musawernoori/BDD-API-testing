Feature: Verifying and testing plans in "tesk insurace app"

  @US_6
  Scenario: Send request to get-all-plan-code
    Given url "https://qa.insurance-api.tekschool-students.com"
    Given path "/api/plans/get-all-plan-code"
    * def  getToken =  callonce read('GenerateToken.feature')
    * def  token = getToken.response.token
    Given print token
    And header authorization = "Bearer " + token

    And request
    """
    {
    "createdBy": "Musawer Ahmad",
    "createdDate": "2023-10-20T19:58:02.571Z",
    "modifiedBy": "Arash",
    "modifiedDate": "2023-10-20T19:58:02.571Z",
    "id": 0,
    "planType": "get all",
    "planBasePrice": 0,
    "icon": "Cow",
    "expirationDate": "2023-10-20T19:58:02.571Z",
    "planExpired": true,
    "new": true
  }
    """
    When method get
    Then status 200
    And print response



