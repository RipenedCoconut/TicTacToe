//
//  GameControl.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/13/25.
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
    var winMessage: String{
        switch self {
        case .player: return "You win the game!"
        case .computer: return "The computer bested you!"
        case .draw: return "It's a draw!"
        }
    }
}

//Holds the current winner; gameOver is true only when a winner has been determined
var currentWinner = winType.draw
var gameOver = false

//Hold the taken spots for each player; openOptions holds the unchosen spots
var playerTiles: [tileLocation] = []
var cpuTiles: [tileLocation] = []
var openOptions: [tileLocation] = [.a1, .a2, .a3, .b1, .b2, .b3, .c1, .c2, .c3]

//Define the symbol used for each player
let playerSymbol = "X"
let cpuSymbol = "O"

//Hard coded list of all the possible winning combinations
let winningCombos: [[tileLocation]] = [[.a1, .a2, .a3], [.b1, .b2, .b3], [.c1, .c2, .c3], [.a1, .b1, .c1], [.a2, .b2, .c2], [.a3, .b3, .c3], [.a1, .b2, .c3], [.a3, .b2, .c1]]

//This struct represents the current game
struct currentGame {
    
    //Counts the number of moves the human player has made
    var moves = 0
    
    //Action for when player chooses a tile
    mutating func buttonPressed(bPressed: tileLocation) {
        
        //Wrapper to prevent player from selecting a taken location
        if(openOptions.contains(bPressed)){
            moves += 1
            if(!playerTiles.contains(bPressed)){
                playerTiles.append(bPressed)
                openOptions.removeAll {$0 == bPressed}
                currentWinner = winType.player
            }
            
            //Check if player move won, then execute next move strategy
            gameOver = checkWinCondition(tileList: playerTiles)
            nextMove()
        }
    }
    
    //Auto-run function to make game moves
    mutating func nextMove() {
        //If the number of player moves is greater than 4, the game is a draw
        if(moves > 4){
            gameOver = true
            currentWinner = winType.draw
        }
        
        //Execute computer player strategy only when game not concluded
        if(!gameOver){
            let cpuMax: Int = openOptions.count - 1
            let cpuChoice = Int.random(in: 0...cpuMax)
            
            //Add computer choice and remove it from available options list
            cpuTiles.append(openOptions[cpuChoice])
            openOptions.remove(at: cpuChoice)
            
            //Set the current player as computer and check if last move wins
            currentWinner = winType.computer
            gameOver = checkWinCondition(tileList: cpuTiles)
        }
    }
    
    //Resets all the game variables for a new game
    mutating func newGame() {
        moves = 0
        playerTiles = []
        cpuTiles = []
        openOptions = [.a1, .a2, .a3, .b1, .b2, .b3, .c1, .c2, .c3]
    }
    
    //Returns the current move counter
    func getMoves() -> Int {
        return moves
    }
}

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
        returnText = playerSymbol
    } else if (cpuTiles.contains(buttonID)){
        returnText = cpuSymbol
    }
    
    //Return appropraite button label based on location occupation
    return returnText
}


/*
 * Function test if player/cpu has won.
 *
 * Parameters:
 *      tileList: list of tiles occupied
 *
 * Returns: Correct symbol for the passed button as a string
 */
func checkWinCondition (tileList: [tileLocation]) -> Bool {
    
    for currCondition in winningCombos {
        var matchedElements = 0
        for currElement in currCondition{
            if(tileList.contains(currElement)){
                matchedElements += 1
            }
            if(matchedElements >= 3){
                print("gameWinMet")
                return true
            }
        }
    }
    
    return false
}
