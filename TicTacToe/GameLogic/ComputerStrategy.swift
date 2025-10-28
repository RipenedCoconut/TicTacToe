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
    
    let openTileSet = Set(openOptions)
    
    let cpuTileSet = Set(cpuTiles)
    
    for testCombo in winningCombos {
        let testComboSet = Set(testCombo)
        let potentialWinningSet = testComboSet.intersection(cpuTileSet).union(testComboSet.intersection(openTileSet))
        if(potentialWinningSet.count >= 3 && testComboSet.intersection(cpuTileSet).count > bestComboValue){
            bestComboValue = testComboSet.intersection(cpuTileSet).count
            bestCombo = testCombo
        }
            
    }
    
    for testOption in bestCombo {
        if(openOptions.contains(testOption)){
            bestMove = testOption
        }
    }
    
    return bestMove
}
