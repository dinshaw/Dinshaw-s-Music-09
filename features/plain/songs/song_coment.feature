Feature: comments/song_comment
  Scenario: Comment on a song
    Given there is "1" "song" named "Good Song"
    And I go to "Good Song's song page"
    Then I should see "Comments"
    When I fill in the following:
      | Name  | Joe |
      | Email | joe@tester.com |
      | Url   | http://www.google.com |
      | Comment (textile formatting)  |  Nice Comment |
    And I press "Post Comment"
    Then I should see "Comment was successfully created."
    
  Scenario: Comment on a song
    Given there is "1" "song" named "Good Song"
    And I go to "Good Song's song page"
    Then I should see "Comments"
    And I press "Post Comment"
    Then I should see "Name can't be blank"
    Then I should see "Email can't be blank"    
    Then I should see "Body can't be blank"