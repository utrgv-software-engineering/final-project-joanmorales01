Feature: Change View Gradebook link

Remove the link to “View Gradebook” for non-signed in users

Scenario: Non-signed in users should not be able to access 'view gradebook' link
    Given I am on the homepage
    When I go to the log in page
    Then I should not be able to see the "View Gradebook" link

Scenario: Signed in users should be able to access 'view gradebook' link
    Given there are grades in the gradebook
    And I sign in
    When I visit the homepage
    Then I should be able to see the "View Gradebook" link