Feature: Edit and Delete Shows
  In order to keep show metadata fresh and accurate
  As an administrator
  I want to edit and delete shows

  Background:
    Given the following show records
      | id | name | owner_id | description | logo_file |
      | 1  | foo  | 3        | foo is oof  | logo.png |
    And the following dj_profile records
      | id | name |
      | 3  | bob foo |
      | 4  | chuck bar |

  Scenario: Editing shows
    Given I am on the list of shows
    When I edit show 1
    Then I should see "Editing : foo"
    And show_owner "bob foo" should be selected
    And I should see "foo"
    And I should see "foo is oof"
    And I should see "logo.png"

  Scenario Outline: Saving Changes
    Given I am on the list of shows
    When I edit show 1
    And I select "<owner>" from "Owner"
    And I fill in "Name" with "<name>"
    And I fill in "Description" with "<description>"
    And I fill in "Logo file" with "<logo_file>"
    And I press "Save"
    Then I should <action1>

    Examples:
      | owner     | name | description | logo_file | action1 |
      |           |      |             |          | see "Error updating show" |
      |           | blah | foo         | logo.png | see "Owner can't be blank" |
      | bob foo   |      | bar         | logo.png | see the error "Name ... can't be blank" in the show form |
      | bob foo   | zot  |             | logo.png | see the error "Description ... can't be blank" in the show form |
      | chuck bar | superawesome-o  | teh best showz evar!!!! | new_logo.gif | see "Saved changes to Show 1" |

  Scenario: Deleting shows
    Given I am on the list of shows
    When I delete show 1
    Then I should see "Deleted Show 1"
    And I should have 0 shows
