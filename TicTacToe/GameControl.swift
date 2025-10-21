//
//  File.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/13/25.
//

import Foundation


struct currentGame {
    var moves = 0
    var playerTurn:Bool = true
    
    func nextMove() {
        if(!playerTurn){
            
        }
    }
    
    mutating func newGame() {
        moves = 0
        playerTurn = true
    }
    
}
