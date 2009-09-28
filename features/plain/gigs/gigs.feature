Featuer: Gigs

  @wip
  Scenario: From the homepage
    Given there are "3" "upcoming gigs" named "The River, MSG, and Kenny's"
    And I am on "the homepage"
    When I click "Gigs"
    Then I should be on "the gigs page"
    And I should see "The River"
    And I should see "10th between 42nd and 43rd"
    And I should see "A, C, or E train to 42nd"    
    And I should see "MSG"
    And I should see "34th and 8th"
    And I should see "A, C, or E train to 34th"        
    And I should see "Kenny's"
    And I should see "Bleeker between Sulliven and Thompson"
    And I should see "A, C, or E train to West 4th"        
