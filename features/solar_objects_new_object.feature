Feature: Creating new solar object

  Scenario: If I click new solar object link and enter valid details to create a new planet it should create a new planet
    Given I am on the solar objects index page
    And I move to the new object page
    When I enter valid planet details into the form
    Then I expect a new planet to be created

  Scenario: If I click new solar object link and enter valid details to create a new moon it should create a new planet
    Given I am on the solar objects index page
    And I move to the new object page
    When I enter valid moon details into the form
    Then I expect a new moon to be created
