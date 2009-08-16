Feature: Edit and Delete DJs
  In order to weed out the jackasses and keep everyones dj profile is up to date
  As an administrator
  I want to edit and delete dj_profiles

  Background:
    Given the following dj_profile records
      | id | user_id | name        | email |
      | 1  |    3    | DJ BobDobbs | bobdobbs@piratecat.org |
      | 2  |    4    | DJ Tanner   | dj_tanner@piratecat.org |
    And the following user records
      | id | name     | email               | role |
      | 3  | Robert   | bobs.real@email.com | DJ |
      | 4  | Donna Jo | dj@fullhouse.com    | intern |

  Scenario: Editing dj_profiles
    Given I am on the list of dj_profiles
    When I edit dj_profile 1
    Then I should see "Editing : DJ BobDobbs"
    And dj_profile_user "Robert" should be selected
    And I should see "DJ BobDobbs"
    And I should see "bobdobbs@piratecat.org"

  Scenario Outline: Saving Changes
    Given I am on the list of dj_profiles
    When I edit dj_profile 1
    And I select "<user>" from "User"
    And I fill in "Name" with "<name>"
    And I fill in "Email" with "<email>"
    And I press "Save"
    Then I should <action>

    Examples:
      | user     | name | email | action |
      |          |      |       | see "Error updating DJ" |
      |          | bob  | a@b.c | see "User can't be blank" |
      | Robert   |      | a@b.c | see the error "Name ... can't be blank" in the dj_profile form |
      | Robert   | bob  |       | see the error "Email ... can't be blank" in the dj_profile form |
      | Donna Jo | bob  | a@b.c | see "Saved changes to DJ Profile 1" |
      | Robert   | DJ BobDobbs | bobdobbs@piratecat.org | see "No changes to save" |

  Scenario: Deleting dj_profiles
    Given I am on the list of dj_profiles
    When I delete dj_profile 1
    Then I should see "Deleted DJ Profile 1"
    And I should have 1 dj_profile

