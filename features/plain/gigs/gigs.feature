Feature: Gigs
  Scenario: From the homepage
    Given there are "3" "upcoming gigs" named "The River, MSG, and Kenny's"
    And I am on "the homepage"
    When I click "Gigs"
    Then I should be on "the gigs page"
    And I should see "The River"

    And I should see "MSG"

    And I should see "Kenny's"

