Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Diamonds as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "D"   | "U"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD,AH" | "5D,JD,AH,AD,KD,QD,10D,9D,8D,7D,6D,4D,3D,2D" |
    | "D"   | "C"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD,AH" | "5D,JD,AH,AD,KD,QD,10D,9D,8D,7D,6D,4D,3D,2D" |
    | "D"   | "D"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD,AH" | "5D,JD,AH,AD,KD,QD,10D,9D,8D,7D,6D,4D,3D,2D" |
    | "D"   | "H"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD,AH" | "5D,JD,AH,AD,KD,QD,10D,9D,8D,7D,6D,4D,3D,2D" |
    | "D"   | "S"     | "10D,9D,8D,7D,6D,5D,4D,3D,2D,AD,JD,QD,KD,AH" | "5D,JD,AH,AD,KD,QD,10D,9D,8D,7D,6D,4D,3D,2D" |
