//
//  ComputerStrategy.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/22/25.
//

import Foundation

var playerWinningMove = openOptions[0]

//func findBestMove2() -> tileLocation {
//    var bestMove: tileLocation = openOptions.randomElement()!
//    var bestCombo = winningCombos[0]
//    var bestComboValue = 0
//    
//    let openTileSet = Set(openOptions)
//    let cpuTileSet = Set(cpuTiles)
//    
//    for testCombo in winningCombos {
//        let testComboSet = Set(testCombo)
//        let potentialWinningSet = testComboSet.intersection(cpuTileSet).union(testComboSet.intersection(openTileSet))
//        if(potentialWinningSet.count >= 3 && testComboSet.intersection(cpuTileSet).count > bestComboValue){
//            bestComboValue = testComboSet.intersection(cpuTileSet).count
//            bestCombo = testCombo
//        }
//    }
//    
//    for testOption in bestCombo {
//        if(openOptions.contains(testOption)){
//            bestMove = testOption
//        }
//    }
//    
//    return bestMove
//}

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
    
    if(canPlayerWin()){
        bestMove = playerWinningMove
    } else {
        for testOption in bestCombo {
            if(openOptions.contains(testOption)){
                bestMove = testOption
            }
        }
    }
    
    return bestMove
}

func canPlayerWin() -> Bool {
    var willPlayerWin = false
    var playerInCombo = 0
    var openInCombo = 0
    var playerWinningCombo = winningCombos[0]
    
    for testCombo in winningCombos{
        for testOption in testCombo{
            if(playerTiles.contains(testOption)){
                playerInCombo += 1
            } else if(openOptions.contains(testOption)){
                openInCombo += 1
            }
        }
        if(playerInCombo >= 2 && openInCombo == 1){
            willPlayerWin = true
            playerWinningCombo = testCombo
        }
        playerInCombo = 0
        openInCombo = 0
        if(willPlayerWin == true){
            for testOption in playerWinningCombo {
                if(openOptions.contains(testOption)){
                    playerWinningMove = testOption
                }
            }
            break
        }
    }
    
    return willPlayerWin
}
