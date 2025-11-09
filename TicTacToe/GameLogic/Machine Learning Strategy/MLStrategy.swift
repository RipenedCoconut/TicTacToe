//
//  MLStrategy.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 11/7/25.
//

import Foundation
import CoreML

let modelNormal = initModel()

func initModel() -> TicTacClassifier {
    guard let modelN = try? TicTacClassifier(configuration: MLModelConfiguration()) else {
        fatalError("Model failed to load")
    }
    
    return modelN
}


func MLMoveNormal() -> tileLocation {
    let ComputerWin: Int64 = 1
    
    guard let nextMove = try? modelNormal.prediction(ComputerTiles: parseMoveData(tileList: cpuTiles), PlayerTiles: parseMoveData(tileList: playerTiles), ComputerWon: ComputerWin) else {
        fatalError("Model failed to predict move")
    }
    

    return parseMLOutput(modelOut: nextMove.ComputerNextMove)
}
