Feature: member defines a new project

  As a member (logged in user)
  I want to create a project
  So that I can upload my data
  And run an application with my data

  Scenario: a member defines a new project with X11 support
    Given I'm a member
    When I create a new project
    And I select a supported operating system from a list
    And I select a supported tool from a list
    And I select a size for my data
    Then I should be presented with a report information
    And I should see the list of my projects

  Scenario: a non member tries to define a project
    Given I'm not a member
    When I create a new project
    Then I should be presented with an error message
    And I should be see information about how to register

