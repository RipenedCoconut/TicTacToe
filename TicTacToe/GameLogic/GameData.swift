//
//  GameData.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/22/25.
//

import Foundation

//Type for all possible tile locations
enum tileLocation {
    case a1, a2, a3, b1, b2, b3, c1, c2, c3
}

//Three win types: player, cpu, draw
enum winType {
    case player, computer, draw
    
    //Resulting message displayed after each win type
    var winMessage: String {
        switch self {
        case .player: return "You win the game!"
        case .computer: return "The computer beat you!"
        case .draw: return "It's a draw!"
        }
    }
}

enum playerType {
    case player, computer
    
    var tiles: [tileLocation]{
        switch self {
        case .player: return playerTiles
        case .computer: return cpuTiles
        }
    }
}

enum gameDifficulty{
    case easy, normal
    
    var label: String {
        switch self {
        case .easy: return "Easy"
        case .normal: return "Normal"
        }
    }
    var bestMove: tileLocation {
        switch self {
        case .easy: return findBestMoveEasy()
        case .normal: return findBestMoveNormal()
        }
    }
   
}

enum playerSymbol {
    case playerX, playerO
    
    var label: String {
        switch self {
        case .playerX: return "X"
        case .playerO: return "O"
        }
    }
    
    var id: Self { self }
}

//Holds the current winner; gameOver is true only when a winner has been determined
var currentWinner = winType.draw
var gameOver = false
var playerSelection = playerSymbol.playerX
var difficultySelection = gameDifficulty.normal

//Hold the taken spots for each player; openOptions holds the unchosen spots
var playerTiles: [tileLocation] = []
var cpuTiles: [tileLocation] = []
var openOptions: [tileLocation] = [.a1, .a2, .a3, .b1, .b2, .b3, .c1, .c2, .c3]

//Hard coded list of all the possible winning combinations
let winningCombos: [[tileLocation]] = [[.a1, .a2, .a3], [.b1, .b2, .b3], [.c1, .c2, .c3], [.a1, .b1, .c1], [.a2, .b2, .c2], [.a3, .b3, .c3], [.a1, .b2, .c3], [.a3, .b2, .c1]]
