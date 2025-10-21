//
//  ContentView.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/13/25.
//

import SwiftUI

struct ContentView: View {
    @State var currGame = currentGame()
    @State public var showingEndGame = gameOver
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
            HStack{
                Button(buttonText(buttonID: .a1)){
                    currGame.buttonPressed(bPressed: tileLocation.a1)
                    showingEndGame = gameOver
                }
                Button(buttonText(buttonID: .a2)){
                    currGame.buttonPressed(bPressed: tileLocation.a2)
                    showingEndGame = gameOver
                }
                Button(buttonText(buttonID: .a3)){
                    currGame.buttonPressed(bPressed: tileLocation.a3)
                    showingEndGame = gameOver
                }
            }
            HStack{
                Button(buttonText(buttonID: .b1)){
                    currGame.buttonPressed(bPressed: tileLocation.b1)
                    showingEndGame = gameOver
                }
                Button(buttonText(buttonID: .b2)){
                    currGame.buttonPressed(bPressed: tileLocation.b2)
                    showingEndGame = gameOver
                }
                Button(buttonText(buttonID: .b3)){
                    currGame.buttonPressed(bPressed: tileLocation.b3)
                    showingEndGame = gameOver
                }
            }
            HStack {
                Button(buttonText(buttonID: .c1)){
                    currGame.buttonPressed(bPressed: tileLocation.c1)
                    showingEndGame = gameOver
                }
                Button(buttonText(buttonID: .c2)){
                    currGame.buttonPressed(bPressed: tileLocation.c2)
                    showingEndGame = gameOver
                }
                Button(buttonText(buttonID: .c3)){
                    currGame.buttonPressed(bPressed: tileLocation.c3)
                    showingEndGame = gameOver
                } .alert(currentWinner.winMessage, isPresented: $showingEndGame){
                    Button("Close", role: .cancel){}
                }
            }
            
          

            
            Spacer()
                .frame(height: 15)
            
            Text("Move number: " + String(currGame.getMoves()))
               
            HStack{
                Button("New Game"){
                    currGame.newGame()
                }
                Button("Exit"){
                    NSApp.terminate(nil)
                    
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
    
}
