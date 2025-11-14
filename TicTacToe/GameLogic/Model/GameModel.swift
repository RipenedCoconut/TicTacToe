//
//  GameModel.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/13/25.
//

import Foundation

//This struct represents the current game
class GameModel: ObservableObject {

    //Counts the number of moves the human player has made
    @Published var moves = 0
    
    //Holds the current winner; gameOver is true only when a winner has been determined
    @Published var currentWinner = winType.draw
    @Published var gameOver = false
    @Published var playerSelection = playerSymbol.playerX
    @Published var difficultySelection = gameDifficulty.normal

    //Hold the taken spots for each player; openOptions holds the unchosen spots
    @Published var playerTiles: [tileLocation] = []
    @Published var cpuTiles: [tileLocation] = []
    @Published var openOptions: [tileLocation] = [.a1, .a2, .a3, .b1, .b2, .b3, .c1, .c2, .c3]

    func getOpenOptions() -> [tileLocation]{
        return self.openOptions
    }
    
    func getPlayerTiles() -> [tileLocation]{
        return self.playerTiles
    }
    
    func getCPUTiles() -> [tileLocation]{
        return self.cpuTiles
    }
    
    func getGameOver() -> Bool {
        return self.gameOver
    }
    
    //Action for when player chooses a tile
    func buttonPressed(bPressed: tileLocation) {
        
        //Wrapper to prevent player from selecting a taken location
        if(openOptions.contains(bPressed)){
            moves += 1
            if(!playerTiles.contains(bPressed)){
                playerTiles.append(bPressed)
                openOptions.removeAll {$0 == bPressed}
                currentWinner = winType.player
            }
            
            //Check if player move won, then execute next move strategy
            gameOver = checkWinCondition(tileList: playerTiles, currentGame: self)
            nextMove()
        }
    }
    
    //Auto-run function to make game moves
    func nextMove() {
        //If the number of player moves is greater than 4, the game is a draw
        if(moves > 4){
            self.gameOver = true
            currentWinner = winType.draw
        }
        
        //Execute computer player strategy only when game not concluded
        if(!self.gameOver){
            let cpuMove = difficultySelection.bestMove(currentGame: self)
            if let removeIndex = openOptions.firstIndex(of: cpuMove) {
                openOptions.remove(at: removeIndex)
            }
            cpuTiles.append(cpuMove)
            
            //Set the current player as computer and check if last move wins
            currentWinner = winType.computer
            self.gameOver = checkWinCondition(tileList: cpuTiles, currentGame: self)
        }
    }
    
    //Resets all the game variables for a new game
    func newGame() {
        moves = 0
        playerTiles = []
        cpuTiles = []
        openOptions = [.a1, .a2, .a3, .b1, .b2, .b3, .c1, .c2, .c3]
        csvExportData = []
    }
    
    //Returns the current move counter
    func getMoves() -> Int {
        return moves
    }
}
