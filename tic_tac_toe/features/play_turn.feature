Feature: Play on board

Scenario:
    Given a board like this:
        ||1|2|3|
        |1||||
        |2||||
        |3||||
    When a player plays x in row 2, column 1
    Then the board should look like this:
        ||1|2|3|
        |1||||
        |2|x|||
        |3||||