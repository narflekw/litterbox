Feature: Manage Shows
  In order to rule the airwaves with mighty programming
  As an administrator
  I want to create and manage shows

  Scenario: Shows List
    Given I have shows named "Monkey and Pals" and "Grand Theft Audio"
    When I go to the list of shows
    Then I should see "Monkey and Pals"
    And I should see "Grand Theft Audio"

  Scenario: Create valid Show
    Given I have no shows
    And I am on the list of shows
    When I follow "New Show"
    And I fill in "Name" with "Wicked Awesome Radio Show Name"
    And I fill in "Description" with "The best thing you have ever heard."
    And I fill in "Owner" with "1"
    And I press "Create"
    Then I should see "New show created"
    And  I should see "Wicked Awesome Radio Show Name"
    And  I should see "The best thing you have ever heard."
    And I should have 1 show
