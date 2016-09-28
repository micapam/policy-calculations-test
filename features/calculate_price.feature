Feature: Calculate price
  In order to budget for my trip
  As a traveller
  I want to know how much my insurance will cost

  Background:
    Given the company has a pricing matrix

  Scenario: Young man on a short trip, no extra features enabled
    Given I am a 25-year-old man taking a four-day trip abroad
    And the site does not have the date of birth feature enabled
    And the site does not have the trip calendar feature enabled
    When I browse to the insurance price calculation page
    And I enter my age as 25
    And I enter my trip duration as four days
    And I submit my information
    Then I should see that it will cost me $50

  Scenario: Middle aged man on a long trip, date of birth feature enabled
    Given I am a 55-year-old man taking a 30-day trip abroad
    And the site has the date of birth feature enabled
    And the site does not have the trip calendar feature enabled
    When I browse to the insurance price calculation page
    And I enter my birth day as 24
    And I enter my birth month as June
    And I enter my birth year as 1961
    And I enter my trip duration as 30 days
    And I submit my information
    Then I should see that it will cost me $90

  Scenario: Older man on a medium trip, date selectors feature enabled
    Given I am a 65-year-old man taking a 13-day trip abroad
    And the site does not have the date of birth feature enabled
    And the site has the trip calendar feature enabled
    When I browse to the insurance price calculation page
    And I enter my age as 65
    And I enter my departure date as 10 October 2016
    And I enter my return date as 23 October 2016
    And I submit my information
    Then I should see that it will cost me $80

  Scenario: Middle aged man on a medium trip, both features enabled
    Given I am a 55-year-old man taking a 10-day trip abroad
    And the site has the date of birth feature enabled
    And the site has the trip calendar feature enabled
    When I browse to the insurance price calculation page
    And I enter my birth day as 24
    And I enter my birth month as June
    And I enter my birth year as 1961
    And I enter my departure date as 10 October 2016
    And I enter my return date as 20 October 2016
    And I submit my information
    Then I should see that it will cost me $73
