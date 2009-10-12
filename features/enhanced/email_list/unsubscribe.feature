Feature: Unsubscribe
  @wip  
  Scenario: email_list/unsubscribe.feature
    Given I go to "the homepage"
    When I fill in "user_email" with "test@tester.com"
    And I press "Signup"
    
    And I go to "the unsubscribe page"
    When I fill in "user_email" with ""
    And I press "Unsubscribe"
    And I wait
    Then I should be on "the unsubscribe page"
    And "button" with "text" "Unsubscribe" should be visible
    And I should see "not found"

    When I fill in "user_email" with "asd"
    And I press "Unsubscribe"
    And I wait
    Then I should be on "the unsubscribe page"
    And "button" with "text" "Unsubscribe" should be visible
    And I should see "not found"
    And I should see "asd"

    When I fill in "user_email" with "test@tester.com"
    And I press "Unsubscribe"
    And I wait
    And I should see "removed"
