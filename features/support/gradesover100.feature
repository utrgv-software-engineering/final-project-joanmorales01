Feature: Reject grades over 100

Grades over 100 cannot be possible, check to make sure value input is below 101

Scenario: I should not be able to input a grade over 100
    Given there are grades in the gradebook
    And I sign in
    When I visit the homepage
    And I click "New Grade"
    And I fill out the form with a grade over 100 and submit
    Then I should have not added a grade