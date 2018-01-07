Feature: Editing existing solar object

  Scenario: If I click edit solar object link and enter valid details to a edit a planet it should update the planet details
    Given I am on the solar objects page
    And I click on the link for a planet
    And I click the edit link on the show page
    When I enter valid planet details into the edit form
    Then I expect a the planet to be updated

  Scenario: If I click edit solar object link and enter valid details to a edit a moon it should update the moon details
    Given I am on the solar objects page
    And I click on the link for a moon
    And I click the edit link
    When I enter valid moon details into the edit form
    Then I expect a the moon to be updated
