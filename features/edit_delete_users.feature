Feature: Edit and Delete Users
  In order to weed out the jackasses and keep everyones dj profile is up to date
  As an administrator
  I want to edit and delete users

  Background:
    Given the following user records
      | id | name     | email               | role |
      | 1  | Robert   | bobs.real@email.com | DJ |
      | 2  | Donna Jo | dj@fullhouse.com    | intern |

  Scenario: Editing users
    Given I am on the list of users
    When I edit user 1
    Then I should see "Editing : Robert"
    And I should see "bobs.real@email.com"

  Scenario Outline: Saving Changes
    Given I am on the list of users
    When I edit user 1
    And I fill in "Name" with "<name>"
    And I fill in "Email" with "<email>"
    And I press "Save"
    Then I should <action>

    Examples:
      | name | email | action |
      |      |       | see "Error updating User" |
      |      | a@b.c | see the error "Name ... can't be blank" in the user form |
      | bob  |       | see the error "Email ... can't be blank" in the user form |
      | Bob Dobbs  | bob@slacker.org | see "Saved changes to User 1" |

  Scenario: Deleting users
    Given I am on the list of users
    When I delete user 1
    Then I should see "Deleted User 1"
    And I should have 1 user

