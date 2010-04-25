Feature: Registered user signs in
  In order to authenticate myself and access my account
  As a registered user that is not currently signed in
  I should be able to sign in using my username and password

  Scenario: Registered user signs in successfully
    Given a registered user called "aimee" with password "test1ng"
    When I go to the sign in page
    Then I should find a form that allows me to sign in
    When I fill in "Login" with "aimee"
    And I fill in "Password" with "test1ng"
    And I press "Sign in"
    Then I should see "Signed in successfully"
    And I should be signed in

  Scenario: User cannot sign in without having registered
    Given I am a new visitor
    When I go to the sign in page
    And I fill in "Login" with "newbie"
    And I fill in "Password" with "passw0rd"
    And I press "Sign in"
    Then I should see "is not valid"
    And I should not be signed in

  Scenario: User cannot sign in with an incorrect password
    Given a registered user called "aimee" with password "corr3ct"
    When I go to the sign in page
    And I fill in "Login" with "aimee"
    And I fill in "Password" with "wr0ng"
    And I press "Sign in"
    Then I should see "is not valid"
    And I should not be signed in
