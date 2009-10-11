Feature: songs/comment
  @wip
  Scenario: Comment on a song with success
    Given there is "1" "song" named "Good Song"
    And I go to "Good Song's song page"
    Then I should see "Comments"
    When I fill in "Name" with "Joe"
    When I fill in "Email" with "Joe@asd.com"
    When I fill in "Url" with "http://www.google.com"
    When I fill in "Comment" with "Nice Comment"
    And I press "Post Comment"
    Then I should see "Comment was successfully created."
  
  Scenario: Comment on a song with error
    Given there is "1" "song" named "Good Song"
    And I go to "Good Song's song page"
    Then I should see "Comments"
    And I press "Post Comment"
    Then I should see "Name can't be blank"
    Then I should see "Email can't be blank"    
    Then I should see "Body can't be blank"