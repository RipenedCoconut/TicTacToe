//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Garrett Forsythe on 10/13/25.
//

import Testing
@testable import TicTacToe

struct TicTacToeTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test func testWinConditions() async throws {
        let exampleTiles: [tileLocation] = [.a1, .a2, .a3]
        #expect(checkWinCondition(tileList: exampleTiles) == true)
    }
}
