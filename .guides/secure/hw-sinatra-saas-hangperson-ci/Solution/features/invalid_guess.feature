Feature: guess repeated letter

  As a player playing Hangperson
  So that I can avoid wasting guesses on letters I've already tried
  I want to be informed when I guess a letter I've already tried

Scenario: guess an empty value

  Given I start a new game with word "bumblebee"
  When I guess ""
  Then I should see "Invalid guess."

Scenario: guess a non-letter

  Given I start a new game with word "giraffe"
  When I guess "@"
  And I should see "Invalid guess."
