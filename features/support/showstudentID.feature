Feature: Show Student ID

  Scenario: View category Student ID on homepage
    Given there are grades in the gradebook    
    And I sign in                              
    When I visit the homepage                  
    Then I should see a column labeled Student ID

  Scenario: View category Student ID on Show   
    Given there are grades in the gradebook    
    And I sign in                              
    When I visit the homepage                  
    Then I should see everyone's grades        
    And I click "Show" on a post               
    Then I should see a label called Student ID

  Scenario: View category Student ID on form   
    Given there are grades in the gradebook    
    And I sign in                              
    When I visit the homepage                  
    And I click "New Grade"                    
    Then I should see a box labeled Student id