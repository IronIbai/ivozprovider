Feature: Create match list patterns
  In order to manage match list patterns
  As a client admin
  I need to be able to create them through the API.

  @createSchema
  Scenario: Create a match list pattern
    Given I add Company Authorization header
     When I add "Content-Type" header equal to "application/json"
      And I add "Accept" header equal to "application/json"
      And I send a "POST" request to "/match_list_patterns" with body:
    """
      {
          "description": "new match list pattern",
          "type": "number",
          "regexp": null,
          "numbervalue": "946002051",
          "matchList": 2,
          "numberCountry": 77
      }
    """
    Then the response status code should be 201
     And the response should be in JSON
     And the header "Content-Type" should be equal to "application/json; charset=utf-8"
     And the JSON should be equal to:
    """
      {
          "description": "new match list pattern",
          "type": "number",
          "regexp": null,
          "numbervalue": "946002051",
          "id": 3,
          "matchList": 2,
          "numberCountry": 77
      }
    """

  Scenario: Retrieve created match list pattern
    Given I add Company Authorization header
     When I add "Accept" header equal to "application/json"
      And I send a "GET" request to "match_list_patterns/3"
     Then the response status code should be 200
      And the response should be in JSON
      And the header "Content-Type" should be equal to "application/json; charset=utf-8"
      And the JSON should be like:
    """
      {
          "description": "new match list pattern",
          "type": "number",
          "regexp": null,
          "numbervalue": "946002051",
          "id": 3,
          "matchList": {
              "name": "testMatchlist2",
              "id": 2
          },
          "numberCountry": "~"
      }
    """
