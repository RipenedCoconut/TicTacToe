//
//  MLStrategy.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 11/7/25.
//

import Foundation
import CoreML


func MLMoveNormal() -> tileLocation {
    guard let modelNormal = try? TicTacClassifier(configuration: MLModelConfiguration()) else {
        fatalError("Model failed to load")
    }

    return .a1
}
