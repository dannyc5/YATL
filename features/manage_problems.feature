Feature: Manage Problems
  As a user
  I need to manage my problem
  So that I can forget my real problems.

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

  Scenario: Edit a problem
    Given I have a problem
    And I am on the problems page
    When I click edit for a problem
    And I edit the problem message
    Then I should see the new message
