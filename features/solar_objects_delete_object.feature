Feature: Deleting existing solar object

  Scenario: If I click delete solar object button on a solar object show page for a planet it will delete the planet
    Given I am on the solar objects page
    And I click on the link for a planet that I want to delete
    When I click on the delete button
    Then I expect a the planet to be deleted

  Scenario: If I click delete solar object button on a solar object show page for a planet it will delete the planet
    Given I am on the solar objects page
    And I click on the link for a moon that I want to delete
    When I click on the delete button
    Then I expect a the moon to be deleted
