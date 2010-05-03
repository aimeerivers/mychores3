Feature: Team member creates tasks
  In order to know what tasks my team and i have to do
  As a team member
  I want to create tasks for my team

  Scenario: Team member creates a task
    Given user "aimee" in team "Household"
    When I go to the new task page
    And I fill in the following:
      | Name        | Water plants   |
      | Description | on the balcony |
    And I select "2010-04-30" as the "Due on" date
    And I press "Create Task"
    Then there should be a task called "Water plants" due on 2010-04-30
