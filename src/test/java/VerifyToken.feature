Feature:ff

  @US_2
  Scenario: Generate a token with wrong username and 404 should be expected
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request
    """
    {
  "username": "rupervisor",
  "password": "tek_supervisor"
}
    """
    When method post
    Then status 404

  @US_3
  Scenario: verfiying token and the message should be "Token valid"
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token/verify"
    And param token = "eyJraWQiOiJUZWtzY2hvb2wgSW5zdXJhbmNlIEFwcGxpY2F0aW9uIiwidHlwIjoiSldUIiwiYWxnIjoiSFM1MTIifQ.eyJhdWQiOiJVc2VyIG1hbmFnZW1lbnQgcG9ydGFsIiwic3ViIjoiU1VQRVJWSVNPUiIsImlzcyI6IlRlayBJbnN1cmFuY2UgQXBwbGljYXRpb24iLCJBdXRob3JpdGllcyI6WyJBRE1JTiJdLCJleHAiOjE2OTc5MTY4MzAsImlhdCI6MTY5NzgzMDQzMH0.r2Heh906QGwlbwUpYShbD06mTIy9hL8blxbopY_GdGveXcFJ2zLIPxuSGLt3IMQ79VfJR3vGmb9o8BPqt9l3MQ"
    And param username = "supervisor"
    When method get
    Then status 200

  @US_4
  Scenario: verifying token with invalid username and the error message should be "Wrong username send along with Token".
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token/verify"
    And param token = "eyJraWQiOiJUZWtzY2hvb2wgSW5zdXJhbmNlIEFwcGxpY2F0aW9uIiwidHlwIjoiSldUIiwiYWxnIjoiSFM1MTIifQ.eyJhdWQiOiJVc2VyIG1hbmFnZW1lbnQgcG9ydGFsIiwic3ViIjoiU1VQRVJWSVNPUiIsImlzcyI6IlRlayBJbnN1cmFuY2UgQXBwbGljYXRpb24iLCJBdXRob3JpdGllcyI6WyJBRE1JTiJdLCJleHAiOjE2OTc5MTY4MzAsImlhdCI6MTY5NzgzMDQzMH0.r2Heh906QGwlbwUpYShbD06mTIy9hL8blxbopY_GdGveXcFJ2zLIPxuSGLt3IMQ79VfJR3vGmb9o8BPqt9l3MQ"
    And param username = "rupervisor"
    When method get
    Then status 400
    Then print response

  @US_5
  Scenario: verifying token with valid username but invalid token and the error message should be "Token invalid or expired".
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token/verify"
    And param token = "zyJraWQiOiJUZWtzY2hvb2wgSW5zdXJhbmNlIEFwcGxpY2F0aW9uIiwidHlwIjoiSldUIiwiYWxnIjoiSFM1MTIifQ.eyJhdWQiOiJVc2VyIG1hbmFnZW1lbnQgcG9ydGFsIiwic3ViIjoiU1VQRVJWSVNPUiIsImlzcyI6IlRlayBJbnN1cmFuY2UgQXBwbGljYXRpb24iLCJBdXRob3JpdGllcyI6WyJBRE1JTiJdLCJleHAiOjE2OTc5MTY4MzAsImlhdCI6MTY5NzgzMDQzMH0.r2Heh906QGwlbwUpYShbD06mTIy9hL8blxbopY_GdGveXcFJ2zLIPxuSGLt3IMQ79VfJR3vGmb9o8BPqt9l3MQ"
    And param username = "supervisor"
    When method get
    Then status 400
    Then print response

