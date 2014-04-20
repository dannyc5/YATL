Feature: Manage Problems
  As a user
  I need to create a problem
  So that I can hide my real problems.

  Scenario:
    Given I am on the problems page
    When I click add problem
    And I fill out a new problem
    Then I should see the new problem
