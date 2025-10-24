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
    @State public var selectedOption: playerSymbol = playerSymbol.playerX
    
    let options: [playerSymbol] = [.playerX, .playerO]
    
    var body: some View {
        VStack {
            HStack{
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .a1)){
                    currGame.buttonPressed(bPressed: tileLocation.a1)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .a2)){
                    currGame.buttonPressed(bPressed: tileLocation.a2)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .a3)){
                    currGame.buttonPressed(bPressed: tileLocation.a3)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
            }
            HStack{
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .b1)){
                    currGame.buttonPressed(bPressed: tileLocation.b1)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .b2)){
                    currGame.buttonPressed(bPressed: tileLocation.b2)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .b3)){
                    currGame.buttonPressed(bPressed: tileLocation.b3)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
            }
            HStack {
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .c1)){
                    currGame.buttonPressed(bPressed: tileLocation.c1)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .c2)){
                    currGame.buttonPressed(bPressed: tileLocation.c2)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                //Button text determined by buttonText function in currentGame()
                Button(buttonText(buttonID: .c3)){
                    currGame.buttonPressed(bPressed: tileLocation.c3)
                    
                    //If game is over, show dialog
                    showingEndGame = gameOver
                }.buttonStyle(.bordered)
                
                .alert(currentWinner.winMessage, isPresented: $showingEndGame){
                    Button("Close", role: .cancel){}
                }
            }
            
            Spacer()
                .frame(height: 15)
            
            Button("New Game"){
                currGame.newGame()
            }
            
            Picker("Symbol:", selection: $selectedOption) {
                Text(playerSymbol.playerX.label).tag(playerSymbol.playerX)
                Text(playerSymbol.playerO.label).tag(playerSymbol.playerO)
            } .onChange(of: selectedOption) {
                playerSelection = selectedOption
            }
            
            Text("Move number: " + String(currGame.getMoves()))
        }
        .padding()
    }

}
#Preview {
    ContentView()
}
