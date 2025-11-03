# Swift TicTacToe
TicTacToe app designed for macOS with a cross compatibility focus. The  current use case is to train a createML AI model opponent with variable difficulty.
### SwiftUI
Currently in it's early stages, this app runs on macOS in a single view leveraging SwiftUI. This model should allow for simple porting to iOS, iPadOS, and watchOS devices. When the player chooses a square, the computer immediately responds until the game is complete.
### Core ML
The next phase of this project will be training a Core ML model to play aginst the user. The AI model will be trained with varying levels of difficulty to keep the game engaging for all users. At this stage, the computer is selecting random locations during it's turn.

## TO-DO
Tasks left to be implemented in this project:
### Near-term
* Improve documentation of code
* Fix button size and improve gerneal appearance
* Create test plan
* Add ability to change player symbol (X or O) ☑
* Create algorithim for CPU player ☑
* Add iOS build target ☑
### Medium-term
* Conform app to MVVM standard
* Implement varying difficulty levels ☑
* Add ability for UI to scale
* Begin training ML model ☑
### Long-term
* Store user scores in database
* Create scalable UI across all Apple platforms
## Demo: Current Functionality
Current as of: 10/21/25
<p align="center">
<img class="roundrect" src=https://github.com/RipenedCoconut/TicTacToe/blob/main/.app/ui.gif width="25%" height="25%"/>
</p>

