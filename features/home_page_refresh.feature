Feature: Refresh API


  Scenario: If I click the refresh button the page should update
    Given I am on the project_home_page
    When I click the refresh info button
    Then the page successfully refreshes
