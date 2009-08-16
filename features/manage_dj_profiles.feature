Feature: Manage DjProfiles
  In order to make sure the shows belong to someone, while allowing that person some level of anonymity, or at least letting them to choose where to receive their hatemail
  As an administrator
  I want to create and manage dj profiles

  Background:
    Given the following user records
      | id | name     | email               | role |
      | 3  | Robert   | bobs.real@email.com | DJ |
      | 4  | Donna Jo | dj@fullhouse.com    | intern |

  Scenario: DJ List
    Given I have dj_profiles named "Bob Dobbs" and "Steve McQueen"
    When I go to the list of dj_profiles
    Then I should see "Bob Dobbs"
    And I should see "Steve McQueen"

  Scenario: Create valid DJ
    Given I have no dj_profiles
    And   I am on the list of dj_profiles
    When I follow "New DJ"
    And  I fill in "User" with "1"
    And  I fill in "Name" with "Newest"
    And  I fill in "Email" with "newest.cat@piratecat.org"
    And  I fill in "Twitter Id" with "@newest_yarrrr"
    And  I press "Create"
    Then I should see "New DJ Profile created"
    And  I should see "Newest"
    And  I should see "newest.cat@piratecat.org"
    And  I should see "@newest_yarrrr"
    And  I should have 1 dj_profile

  Scenario Outline: Try to create invalid DJ profile
    Given I have no dj_profiles
    And   I am on the list of dj_profiles
    When I follow "New DJ"
    And  I fill in "User" with "<user>"
    And  I fill in "Name" with "<name>"
    And  I fill in "Email" with "<email>"
    And I press "Create"
    Then I should <action>
    And  I should have 0 dj_profiles

    Examples:
      | user   | name | email | action |
      |        |      |       | see "Error creating DJ Profile" |
      |        | bob  | a@b.c | see "User can't be blank" |
      | Robert |      | a@b.c | see the error "Name ... can't be blank" in the dj_profile form |
      | Robert | bob  |       | see the error "Email ... can't be blank" in the dj_profile form |
