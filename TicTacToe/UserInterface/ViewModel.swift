//
//  ButtonDrawing.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/22/25.
//

import Foundation
import SwiftUI

/*
 * Function to generate the button text based on location.
 *
 * Parameters:
 *      buttonID: A valid tileLocation to generate text for
 *
 * Returns: Correct symbol for the passed button as a string
 */

class ButtonModel{
    func text(buttonID: tileLocation, currentGame: GameModel) -> String {
        //Return blank string to show an empty square
        var returnText = "  "
        
        //Check location for player or computer occupation, if so mark the spot
        if(currentGame.playerTiles.contains(buttonID)){
            returnText = currentGame.playerSelection.label
        } else if (currentGame.cpuTiles.contains(buttonID)){
            if(currentGame.playerSelection == .playerO){
                returnText = playerSymbol.playerX.label
            } else {
                returnText = playerSymbol.playerO.label
            }
        }
        //Return appropraite button label based on location occupation
        return returnText
    }
}
