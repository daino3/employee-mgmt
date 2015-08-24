@active @javascript
Feature: I can create an employee
  Scenario: By filling out a form
    Given I visit the home page
    And I click "Employees"
    And I fill in "first_name" with "Steve"
    And I fill in "last_name" with "Smith"
    And I fill in "hire_date" with "2011-10-31"
    Then I should see "Sucess! Employee created"
    And I should see the following employees:
      |First Name| Last Name| Hire Date |
      |Steve     | Smith    | 2011-10-31|
