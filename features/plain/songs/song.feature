Feature: Song
  Scenario: Song details
    Given there is "1" "song" named "Good Song"
    And I am on "the homepage"
    When I click "Songs"
    Then I should see "Good Song"
    When I click "Good Song"
    Then I should be on "Good Song's song page"