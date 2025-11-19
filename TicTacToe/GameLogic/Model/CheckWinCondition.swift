//
//  CheckWinCondition.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 11/13/25.
//


/*
 * Function test if player/cpu has won.
 *
 * Parameters:
 *      tileList: list of tiles occupied
 *
 * Returns: Correct symbol for the passed button as a string
 */
func checkWinCondition (tileList: [tileLocation], currentGame: GameModel) -> Bool {
    for currCondition in winningCombos {
        var matchedElements = 0
        for currElement in currCondition{
            if(tileList.contains(currElement)){
                matchedElements += 1
            }
            if(matchedElements >= 3){
                print("gameWinMet")
                exportData(currentGame: currentGame)
                return true
            }
        }
    }
    return false
}
