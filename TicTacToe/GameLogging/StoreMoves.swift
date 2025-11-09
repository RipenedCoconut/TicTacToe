//
//  StoreMoves.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/31/25.
//

import Foundation

var csvExportData: [[String]] = []

func saveComputerMove (cpuNextMove: tileLocation) {
    let gameComputerTiles = cpuTiles.map { $0.toString }.joined(separator: "-")
    let gamePlayerTiles = playerTiles.map { $0.toString }.joined(separator: "-")
    let gameNextTile = String(describing: cpuNextMove)
    
    let csvRowData = [gameComputerTiles, gamePlayerTiles, gameNextTile]
    
    csvExportData.append(csvRowData)
}

func exportData() {
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        print("Could not access documents directory.")
        return
    }
    let fileURL = documentsDirectory.appendingPathComponent("TicTacData.csv")
    
    let computerWin = (currentWinner == .computer) ? 1 : 0
    
    var csvString = ""
    for csvRow in csvExportData {
        csvString += csvRow.joined(separator: ",") + ",\(computerWin)" + "\n"
    }

    if csvString.isEmpty {
        print("No data to export.")
        return
    }
    
    do {
        if FileManager.default.fileExists(atPath: fileURL.path) {
            let fileHandle = try FileHandle(forUpdating: fileURL)
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            if let data = csvString.data(using: .utf8) {
                fileHandle.write(data)
                print("Appended data to TicTacData.csv")
            }
        } else {
            let header = "ComputerTiles,PlayerTiles,ComputerNextMove,ComputerWon\n"
            try (header + csvString).write(to: fileURL, atomically: true, encoding: .utf8)
            print("Created TicTacData.csv and saved data.")
        }
    } catch {
        print("Failed to write to file: \(error)")
    }
}
