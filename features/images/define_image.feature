Feature: member defines a new image

  As a member (logged in user)
  I want to create an image
  So that I can create a project
  And run my application with my data

  Scenario: a member defines an image with X11 support
    Given I'm a member
    When I create a new image
    And I choose a base OS image from a list
    And I select x11 support
    And I add a tool (xilink etc ..) to the image
    Then I should be presented with a report information
    And I should be notifed of progress

  Scenario: a non member tries to define an image
    Given I'm not a member
    When I create a new image
    Then I should be presented with an error message
    And I should be see information about how to register

