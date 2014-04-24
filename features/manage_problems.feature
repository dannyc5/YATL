Feature: Manage Problems
  As a user
  I need to create a problem
  So that I can hide my real problems.

  As a user
  I need to delete problems
  So that I can pretend I forgot.

  Scenario: Create a problem
    Given I am on the problems page
    When I fill out a new problem
    And I click add problem
    Then I should see the new problem

  Scenario: Delete a problem
    Given I have a problem
    And I am on the problems page
    When I click delete for a problem
    Then I should not see the problem

