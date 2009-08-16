Feature: Manage Users
  In order to have DJ profiles tied to a real world person who the station can contact
  As an administrator
  I want to create and manage users

  Scenario: Users List
    Given the following user records
      |name | email |
      | Danny McRealguy | some.real@person.com |
    When I go to the list of users
    Then I should see "Danny McRealguy"
    And I should see "some.real@person.com"

  Scenario: Create valid User
    Given I have no users
    And   I am on the list of users
    When I follow "New User"
    And  I fill in "Name" with "Newest Real Name"
    And  I fill in "Email" with "some.new.guy@email.com"
    And  I press "Create"
    Then I should see "New User created"
    And  I should see "Newest"
    And  I should see "some.new.guy@email.com"
    And  I should have 1 user

  Scenario Outline: Try to create invalid User
    Given I have no users
    And   I am on the list of users
    When I follow "New User"
    And  I fill in "Name" with "<name>"
    And  I fill in "Email" with "<email>"
    And I press "Create"
    Then I should <action>
    And  I should have 0 users

    Examples:
      | name | email | action |
      |      |       | see "Error creating User" |
      |      | a@b.c | see the error "Name ... can't be blank" in the user form |
      | bob  |       | see the error "Email ... can't be blank" in the user form |
