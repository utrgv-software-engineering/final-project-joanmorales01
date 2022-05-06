Feature: Check registration

Registration must not be possible, please remove the sign-up button from the sign in page

Scenario: I should not be able to register
    Given I am on the homepage
    When I go to the log in page
    Then I should not be able to see the "Sign up"button