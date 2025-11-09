//
//  ParseLocation.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 11/7/25.
//

import Foundation

func parseMoveData(tileList: [tileLocation]) -> String {
    var outputString = ""
    
    outputString = tileList.map { $0.toString }.joined(separator: "-")
    
    print("Data: " + outputString + " parsed")
    
    return outputString
}

func parseMLOutput(modelOut: String) -> tileLocation {
    var parsedTile: tileLocation = .a1
    
    for currentCase in tileLocation.allCases {
        if currentCase.toString == modelOut {
            parsedTile = currentCase
    }
}
    
    return parsedTile
}
