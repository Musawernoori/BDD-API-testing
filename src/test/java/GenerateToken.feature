Feature:Generate token and verifying it

  @US_1
  Scenario: Generate a token to send requests by karate
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request
    """
    {
  "username": "supervisor",
  "password": "tek_supervisor"
}
    """
    When method post
    Then status 200
    And print response

    # Token:
  # eyJraWQiOiJUZWtzY2hvb2wgSW5zdXJhbmNlIEFwcGxpY2F0aW9uIiwidHlwIjoiSldUIiwiYWxnIjoiSFM1MTIifQ.eyJhdWQiOiJVc2VyIG1hbmFnZW1lbnQgcG9ydGFsIiwic3ViIjoiU1VQRVJWSVNPUiIsImlzcyI6IlRlayBJbnN1cmFuY2UgQXBwbGljYXRpb24iLCJBdXRob3JpdGllcyI6WyJBRE1JTiJdLCJleHAiOjE2OTc5MTY4MzAsImlhdCI6MTY5NzgzMDQzMH0.r2Heh906QGwlbwUpYShbD06mTIy9hL8blxbopY_GdGveXcFJ2zLIPxuSGLt3IMQ79VfJR3vGmb9o8BPqt9l3MQ





