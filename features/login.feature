@login
Feature: As an DPG Media customer
         I should be able to log in on Volkrant page

  Scenario: User should be able to log in
    Given A DPG Media customer opens the home page
    And I close the cookies modal
    When I click on the Log in button on the home page
    Then I see the Log in page
    When I enter the email address
    And I click on the "Ga verder" button on the login page
    Then I see password field page 
    And I enter the password
    When I click on the "Log in op volkskrant.nl" button on the login page
    Then I dont see the login button on the home page