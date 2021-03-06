Feature: Sign up for the emal List
  In order to sign up for the email list
  As a guest user
  I should submit my email

  Scenario: singup with three tries and a dup
    Given I go to "the homepage"

    When I fill in "user_email" with ""
    And I press "Signup"
    And I wait
    Then I should be on "the homepage"
    And "button" with "text" "Signup" should be visible
    And I should see "unlike an email address"

    When I fill in "user_email" with "testtestercom"
    And I press "Signup"
    And I wait
    Then I should be on "the homepage"
    And "button" with "text" "Signup" should be visible
    And I should see "unlike an email address"

    When I fill in "user_email" with "test@tester.com"
    And I press "Signup"
    And I wait
    Then I should be on "the homepage"
    And I should not see "Signup"
    And I should see "You rock! You are signed up"


    Given I go to "the homepage"
    When I fill in "user_email" with "test@tester.com"
    And I press "Signup"
    And I wait
    Then I should be on "the homepage"
    And "button" with "text" "Signup" should be visible
    And I should see "already on my list"
    