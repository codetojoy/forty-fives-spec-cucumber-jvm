Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Clubs as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "S"   | "U"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD" | "KD,QD,JD,10D,9D,8D,7D,6D,5D,4D,3D,2D,AD" |
    | "S"   | "C"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD" | "KD,QD,JD,10D,9D,8D,7D,6D,5D,4D,3D,2D,AD" |
    | "S"   | "D"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD" | "KD,QD,JD,10D,9D,8D,7D,6D,5D,4D,3D,2D,AD" |
    | "S"   | "H"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD" | "KD,QD,JD,10D,9D,8D,7D,6D,5D,4D,3D,2D,AD" |
    | "S"   | "S"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD" | "KD,QD,JD,10D,9D,8D,7D,6D,5D,4D,3D,2D,AD" |
