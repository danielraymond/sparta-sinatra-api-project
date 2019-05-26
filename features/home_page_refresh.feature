Feature: Refresh API

  Scenario: If I click the refresh button the page should update
    Given I am on the project home page
    When I click the refresh info button
    Then the page successfully refreshes
