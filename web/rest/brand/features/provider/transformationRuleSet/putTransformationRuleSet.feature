Feature: Update transformation rule sets
  In order to manage transformation rule sets
  As a brand admin
  I need to be able to update them through the API.

  @createSchema
  Scenario: Update a transformation rule set
    Given I add Brand Authorization header
     When I add "Content-Type" header equal to "application/json"
      And I add "Accept" header equal to "application/json"
      And I send a "PUT" request to "/transformation_rule_sets/1" with body:
    """
      {
          "description": "Desc",
          "internationalCode": "00",
          "trunkPrefix": "",
          "areaCode": "",
          "nationalLen": 9,
          "generateRules": false,
          "id": 2,
          "name": {
              "en": "updated name",
              "es": "nombre actualizado",
              "ca": "nombre actualizado",
              "it": "nome aggiornato"
          },
          "country": 68
      }
    """
    Then the response status code should be 200
     And the response should be in JSON
     And the header "Content-Type" should be equal to "application/json; charset=utf-8"
     And the JSON should be equal to:
    """
      {
          "description": "Desc",
          "internationalCode": "00",
          "trunkPrefix": "",
          "areaCode": "",
          "nationalLen": 9,
          "generateRules": false,
          "id": 1,
          "name": {
              "en": "updated name",
              "es": "nombre actualizado",
              "ca": "nombre actualizado",
              "it": "nome aggiornato"
          },
          "country": 68,
          "editable": true
      }
    """
