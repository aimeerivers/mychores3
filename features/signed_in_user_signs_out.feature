Feature: Signed in user signs out
  In order to protect my account from unauthorized access
  As a user signed into the site
  I want to sign out

  Scenario: Signed in user signs out
    Given I am signed in as a user called "aimee"
    When I go to the home page
    And I follow "Sign out"
    Then I should see "Signed out successfully"
    And I should not be signed in
