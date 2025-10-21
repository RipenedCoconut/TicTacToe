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
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .a1)){
                    currGame.buttonPressed(bPressed: tileLocation.a1)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .a2)){
                    currGame.buttonPressed(bPressed: tileLocation.a2)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .a3)){
                    currGame.buttonPressed(bPressed: tileLocation.a3)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
            }
            HStack{
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .b1)){
                    currGame.buttonPressed(bPressed: tileLocation.b1)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .b2)){
                    currGame.buttonPressed(bPressed: tileLocation.b2)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .b3)){
                    currGame.buttonPressed(bPressed: tileLocation.b3)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
            }
            HStack {
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .c1)){
                    currGame.buttonPressed(bPressed: tileLocation.c1)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .c2)){
                    currGame.buttonPressed(bPressed: tileLocation.c2)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .c3)){
                    currGame.buttonPressed(bPressed: tileLocation.c3)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }
                
                .alert(currentWinner.winMessage, isPresented: $showingEndGame){
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
