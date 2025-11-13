//
//  ComputerStrategy.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/22/25.
//

import Foundation

let freshModel = GameModel()

var playerWinningMove = freshModel.openOptions[0]
var computerWinningMove = freshModel.openOptions[0]

func findBestMoveEasy(currentGame: GameModel) -> tileLocation {
    var bestMove: tileLocation = currentGame.openOptions.randomElement()!
    var bestCombo = winningCombos[0]
    var bestComboValue = 0
    
    let openTileSet = Set(currentGame.openOptions)
    let cpuTileSet = Set(currentGame.cpuTiles)
    
    if(GameModel().getMoves() > 0){
        for testCombo in winningCombos {
            let testComboSet = Set(testCombo)
            let potentialWinningSet = testComboSet.intersection(cpuTileSet).union(testComboSet.intersection(openTileSet))
            if(potentialWinningSet.count >= 3 && testComboSet.intersection(cpuTileSet).count > bestComboValue){
                bestComboValue = testComboSet.intersection(cpuTileSet).count
                bestCombo = testCombo
            }
        }
        
        for testOption in bestCombo {
            if(currentGame.openOptions.contains(testOption)){
                bestMove = testOption
            }
        }
    }
    
    saveComputerMove(cpuNextMove: bestMove, currentGame: currentGame)
    return bestMove
}

func findBestMoveNormal(currentGame: GameModel) -> tileLocation {
    var bestMove: tileLocation = currentGame.openOptions.randomElement()!
    var bestCombo = winningCombos[0]
    var bestComboValue = 0
    
    let openTileSet = Set(currentGame.openOptions)
    let cpuTileSet = Set(currentGame.cpuTiles)
    
    if(GameModel().getMoves() > 0){
        for testCombo in winningCombos {
            let testComboSet = Set(testCombo)
            let potentialWinningSet = testComboSet.intersection(cpuTileSet).union(testComboSet.intersection(openTileSet))
            if(potentialWinningSet.count >= 3 && testComboSet.intersection(cpuTileSet).count > bestComboValue){
                bestComboValue = testComboSet.intersection(cpuTileSet).count
                bestCombo = testCombo
            }
        }
    }
    
    if(canComputerWin(currentGame: currentGame)){
        bestMove = computerWinningMove
    } else if(canPlayerWin(currentGame: currentGame)){
        bestMove = playerWinningMove
    } else if(GameModel().getMoves() > 0){
        for testOption in bestCombo {
            if(currentGame.openOptions.contains(testOption)){
                bestMove = testOption
            }
        }
    }
    
    saveComputerMove(cpuNextMove: bestMove, currentGame: currentGame)
    return bestMove
}

func canPlayerWin(currentGame: GameModel) -> Bool {
    var willPlayerWin = false
    var playerInCombo = 0
    var openInCombo = 0
    var playerWinningCombo = winningCombos[0]
    
    for testCombo in winningCombos{
        for testOption in testCombo{
            if(currentGame.playerTiles.contains(testOption)){
                playerInCombo += 1
            } else if(currentGame.openOptions.contains(testOption)){
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
                if(currentGame.openOptions.contains(testOption)){
                    playerWinningMove = testOption
                }
            }
            break
        }
    }
    
    return willPlayerWin
}

func canComputerWin(currentGame: GameModel) -> Bool {
    var willComputerWin = false
    var computerInCombo = 0
    var openInCombo = 0
    var computerWinningCombo = winningCombos[0]
    
    for testCombo in winningCombos{
        for testOption in testCombo{
            if(currentGame.cpuTiles.contains(testOption)){
                computerInCombo += 1
            } else if(currentGame.openOptions.contains(testOption)){
                openInCombo += 1
            }
        }
        if(computerInCombo >= 2 && openInCombo == 1){
            willComputerWin = true
            computerWinningCombo = testCombo
        }
        computerInCombo = 0
        openInCombo = 0
        if(willComputerWin == true){
            for testOption in computerWinningCombo {
                if(currentGame.openOptions.contains(testOption)){
                    computerWinningMove = testOption
                }
            }
            break
        }
    }
    
    return willComputerWin
}
