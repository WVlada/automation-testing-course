@home
Feature: Opening Home Page
  In order to avoid silly mistakes
  As a CS amateur
  I want to be able to navigate to some web site

  Scenario: Navigate to news site
    Given I opened HomePage
    When I press Login
    Then displayed text on screen should be Prijavi se