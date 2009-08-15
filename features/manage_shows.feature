Feature: List and Create Shows
  In order to rule the airwaves with mighty programming
  As an administrator
  I want to see a list of shows and create new shows

  Scenario: Shows List
    Given I have shows named "Monkey and Pals" and "Grand Theft Audio"
    When I go to the list of shows
    Then I should see "Monkey and Pals"
    And I should see "Grand Theft Audio"

  Scenario: Create valid Show
    Given I have no shows
    And I am on the list of shows
    When I follow "New Show"
    And I fill in "Owner" with "1"
    And I fill in "Name" with "Wicked Awesome Radio Show Name"
    And I fill in "Description" with "The best thing you have ever heard."
    And I press "Create"
    Then I should see "New show created"
    And  I should see "Wicked Awesome Radio Show Name"
    And  I should see "The best thing you have ever heard."
    And I should have 1 show

  Scenario Outline: Try to create invalid show
    Given I have no shows
    And I am on the list of shows
    When I follow "New Show"
    And I fill in "Owner" with "<owner>"
    And I fill in "Name" with "<name>"
    And I fill in "Description" with "<description>"
    And I press "Create"
    Then I should <action>
    Then I should have 0 shows

    Examples:
      | owner | name | description | action|
      |       |      |             | see "Error creating show"|
      |       | blah | foo         | see "Owner can't be blank"|
      | 1     |      | bar         | see the error "Name ... can't be blank" in the show form|
      | 1     | zot  |             | see the error "Description ... can't be blank" in the show form|

