Feature: New user signs up
  In order to make myself known to the application
  As a new user
  I should be able to sign up for a new account

  Background:
    Given I am a new visitor
    When I go to the sign-up page
    Then I should find a form that allows me to sign up

  Scenario: New user signs up successfully
    When I fill in "Login" with "aimee"
    And I fill in "Email" with "aimee@test.com"
    And I fill in "Password" with "passw0rd"
    And I fill in "Password confirmation" with "passw0rd"
    And I press "Sign up"
    Then I should see "Signed up successfully"
    And I should be signed in

  Scenario Outline: invalid login values
    When I fill in "Login" with "<login>"
    And I press "Sign up"
    Then I should see "<error>"
    Examples:
      | login | error                   |
      | !!!   | should use only letters |
      | aa    | is too short            |

  Scenario: New user cannot sign up with a login that has already been taken
    Given a registered user called "aimee"
    When I fill in "Login" with "aimee"
    And I press "Sign up"
    Then I should see "has already been taken"

  Scenario Outline: invalid email values
    When I fill in "Email" with "<email>"
    And I press "Sign up"
    Then I should see "<error>"
    Examples:
      | email    | error                             |
      | whatever | should look like an email address |
      | a@b.c    | is too short                      |

  Scenario: No requirement for unique email address
    Given a registered user called "aimee"
    When I fill in "Login" with "aimee2"
    And I fill in "Email" with "aimee@test.com"
    And I fill in "Password" with "passw0rd"
    And I fill in "Password confirmation" with "passw0rd"
    And I press "Sign up"
    Then I should see "Signed up successfully"
    And I should see "aimee2"

  Scenario Outline: invalid password values
    When I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<confirmation>"
    And I press "Sign up"
    Then I should see "<error>"
    Examples:
      | password  | confirmation | error                      |
      | 123       | 123          | is too short               |
      | 1234      | 123          | is too short               |
      | asparagus | spargel      | doesn't match confirmation |
