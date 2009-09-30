Feature: Songs
  Scenario: Song list
    Given there are "3" "songs" named "Good Song, Bad Song, and Great Song"
    And I am on "the homepage"
    When I click "Songs"
    Then I should see "Good Song"
    Then I should see "recordings (2)"    
    Then I should see "Bad Song"
    Then I should see "Great Song"      