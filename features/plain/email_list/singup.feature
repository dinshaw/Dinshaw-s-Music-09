Feature: Sign up for the emal List
  In order to sign up for theemail list
  As a guest user
  I should submit my email

  Scenario: singup with good email
    Given I am on "the homepage"
    When I fill in "user_email" with "info@dinshaw.us"
    And I press "Signup"
    And I should see "You rock! You are signed up"
    
  Scenario: singup a duplicate email
    Given there is a user with email "info@dinshaw.us"
    Given I am on "the homepage"
    When I fill in "user_email" with "info@dinshaw.us"
    And I press "Signup"
    And I should see "already on my list"

  Scenario: singup with bad email
    Given I am on "the homepage"
    When I fill in "user_email" with "infodinshawus"
    And I press "Signup"
    And I should see "unlike an email address"

  Scenario: singup with no email
    Given I am on "the homepage"
    When I fill in "user_email" with ""
    And I press "Signup"
    And I should see "suspiciously unlike an email address"

