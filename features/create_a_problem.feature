Feature: Manage Problems
  As a user
  I need to create a problem
  So that I can hide my real problems.

  Scenario: Create a problem
    Given I am on the problems page
    When I fill out a new problem
    And I click add problem
    Then I should see the new problem
