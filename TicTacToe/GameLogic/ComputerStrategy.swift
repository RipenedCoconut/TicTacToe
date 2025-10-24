//
//  ComputerStrategy.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/22/25.
//

import Foundation

func findBestMove() -> tileLocation {
    var bestMove: tileLocation = openOptions.randomElement()!
    var bestCombo = winningCombos[0]
    var bestComboValue = 0
    var currentComboValue = 0
    
    let cpuTileSet = Set(cpuTiles)
    
    for testCombo in winningCombos {
        
        
        // TODO: Fix cpu algorithim
        for testOption in testCombo{
            let testComboSet = Set(testCombo)
            if(openOptions.contains(testOption)){
                currentComboValue += 1
                if(currentComboValue > bestComboValue && (testComboSet.intersection(cpuTileSet).count > 1)){
                    bestComboValue = currentComboValue
                    bestCombo = testCombo
                }
            }
        }
        currentComboValue = 0
    }
    
    for testOption in bestCombo {
        if(openOptions.contains(testOption)){
            bestMove = testOption
        }
    }
    
    return bestMove
}
