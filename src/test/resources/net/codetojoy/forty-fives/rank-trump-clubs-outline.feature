Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Clubs as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "C"   | "C"     | "2C,3C,4C,5C" | "5C,2C,3C,4C" |
    | "C"   | "C"     | "10C,9C,8C,7C,6C,5C,4C,3C,2C,AC,JC,QC,KC,AH" | "5C,JC,AC,KC,QC,2C,3C,4C,6C,7C,8C,9C,10C,AH" |
