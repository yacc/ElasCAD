Feature: member defines a new image

  As a member (logged in user)
  I want to create an image
  So that I can run my application
 
  Scenario: define image
    Given I'm logged in
    When I'm on image/new page
    Then I should be able to choose a base image from a list
    And select x11 support
    And add a tool (xilink etc ..) to the image
    Then click on "create image"
    And be presented with a report/progress page