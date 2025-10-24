//
//  ButtonDrawing.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/22/25.
//

import Foundation

/*
 * Function to generate the button text based on location.
 *
 * Parameters:
 *      buttonID: A valid tileLocation to generate text for
 *
 * Returns: Correct symbol for the passed button as a string
 */
func buttonText(buttonID: tileLocation) -> String {
    //Return blank string to show an empty square
    var returnText = "  "
    
    //Check location for player or computer occupation, if so mark the spot
    if(playerTiles.contains(buttonID)){
        returnText = playerSelection.label
    } else if (cpuTiles.contains(buttonID)){
        if(playerSelection == .playerO){
            returnText = playerSymbol.playerX.label
        } else {
            returnText = playerSymbol.playerO.label
        }
    }
    
    //Return appropraite button label based on location occupation
    return returnText
}
