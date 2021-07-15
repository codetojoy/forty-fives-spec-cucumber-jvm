Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Clubs as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "D"   | "U"     | "10C,9C,8C,7C,6C,5C,4C,3C,2C,AC,JC,QC,KC" | "KC,QC,JC,AC,2C,3C,4C,5C,6C,7C,8C,9C,10C" |
    | "D"   | "C"     | "10C,9C,8C,7C,6C,5C,4C,3C,2C,AC,JC,QC,KC" | "KC,QC,JC,AC,2C,3C,4C,5C,6C,7C,8C,9C,10C" |
    | "D"   | "D"     | "10C,9C,8C,7C,6C,5C,4C,3C,2C,AC,JC,QC,KC" | "KC,QC,JC,AC,2C,3C,4C,5C,6C,7C,8C,9C,10C" |
    | "D"   | "H"     | "10C,9C,8C,7C,6C,5C,4C,3C,2C,AC,JC,QC,KC" | "KC,QC,JC,AC,2C,3C,4C,5C,6C,7C,8C,9C,10C" |
    | "D"   | "S"     | "10C,9C,8C,7C,6C,5C,4C,3C,2C,AC,JC,QC,KC" | "KC,QC,JC,AC,2C,3C,4C,5C,6C,7C,8C,9C,10C" |
