//
//  ContentView.swift
//  TicTacToe
//
//  Created by Garrett Forsythe on 10/13/25.
//

import SwiftUI

struct BoardView: View {
    @StateObject public var currGame = GameModel()
    @State public var selectedSymbol: playerSymbol = playerSymbol.playerX
    @State public var selectedDifficulty: gameDifficulty = .normal
    let bModel = ButtonModel()
    let options: [playerSymbol] = [.playerX, .playerO]

    var body: some View {
        VStack {
            HStack{
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .a1, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.a1)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .a2, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.a2)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .a3, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.a3)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
            }
            HStack{
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .b1, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.b1)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .b2, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.b2)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .b3, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.b3)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
            }
            
            HStack {
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .c1, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.c1)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .c2, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.c2)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                //Button text determined by text function in currentGame()
                Button(bModel.text(buttonID: .c3, currentGame: currGame)){
                    currGame.buttonPressed(bPressed: tileLocation.c3)
                }.buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    .buttonBorderShape(.roundedRectangle)
                    .frame(width: 40, height: 40, alignment: .center)
                
                .alert(currGame.currentWinner.winMessage, isPresented: $currGame.gameOver){
                    Button("Close", role: .cancel){}
                }
            }
            .padding(.bottom, 15)
            
            
            Button("New Game"){
                currGame.newGame()
            }
            
            Picker("Mode:", selection: $selectedDifficulty) {
                Text(gameDifficulty.easy.label).tag(gameDifficulty.easy)
                Text(gameDifficulty.normal.label).tag(gameDifficulty.normal)
                Text(gameDifficulty.mlModel.label).tag(gameDifficulty.mlModel)
            } .onChange(of: selectedDifficulty) {
                currGame.difficultySelection = selectedDifficulty
            }
            
            Picker("Symbol:", selection: $selectedSymbol) {
                Text(playerSymbol.playerX.label).tag(playerSymbol.playerX)
                Text(playerSymbol.playerO.label).tag(playerSymbol.playerO)
            } .onChange(of: selectedSymbol) {
                currGame.playerSelection = selectedSymbol
            }    
            
            
            Text("Move number: " + String(currGame.getMoves()))
        }
        .padding(.all, 30)
        .opacity(10)
        
    }
    

}
#Preview {
    BoardView()
}
