Feature: Edit profile
  In order to update my details
  As a registered user
  I want to be able to edit my profile

  Scenario: User edits their profile
    Given I am signed in as a user called "aimee"
    When I go to the edit profile page
    And I fill in "Email" with "new_email@test.com"
    And I press "Update profile"
    Then the email address for "aimee" should be "new_email@test.com"
