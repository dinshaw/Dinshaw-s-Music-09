Feature: Sign up for the emal List
  In order to sign up for the email list
  As a guest user
  I should submit my email

  Scenario: singup with good email
    Given I am on "the homepage"
    When I fill in "user_email" with "info@dinshaw.us"
    And I press "Signup"
    Then I should be on 'the homepage'
    And I should not see "Signup"
    And I should see "Thank you for signing up!"
    
  # Scenario: singup a duplicate email
  #   Given there is a user with email "info@dinshaw.us"
  #   Given I am on "the signup page"
  #   When I fill in "user_email" with "info@dinshaw.us"
  #   And I press "Signup"
  #   And I should see "already on my list"
  # 
  # Scenario: singup with bad email
  #   Given I am on "the signup page"
  #   When I fill in "user_email" with "infodinshawus"
  #   And I press "Signup"
  #   And I should see "unlike a email address"
  # 
  # Scenario: singup with no email
  #   Given I am on "the signup page"
  #   When I fill in "user_email" with ""
  #   And I press "Signup"
  #   And I should see "you entered nothing"
  # 
