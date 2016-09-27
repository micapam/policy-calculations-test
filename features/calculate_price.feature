Feature: Calculate price
  In order to budget for my trip
  As a traveller
  I want to know how much my insurance will cost

  Background:
    Given the company has a pricing matrix

  Scenario: Young man on a short trip
    Given I am a 25-year-old man taking a four-day trip abroad
    When I browse to the insurance price calculation page
    And I enter my age as 25
    And I enter my trip duration as four days
    And I submit my information
    Then I should see that it will cost me $50
