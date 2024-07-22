import 'dart:async';
import 'dart:io';
import 'alien.dart';
import 'board.dart';
import 'player.dart';

class GameLoop {
  static var count = 0;
  void runGameLoop(Board controlBoard, Alien alien, Player player){
    Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
  // temporary way to track side-to-side alien iterations.
      if (count >= 2) {
        endGame();
      }
      await Future.delayed(Duration(milliseconds: 100));
      // clear the screen after displaying the boardState
      controlBoard.clearScreen();
      controlBoard.updateBoardState(
          alien.alienPositions, player.playerPosition);
      // display the boardState after each update
      controlBoard.printBoardState();
      // sleep keeps the boardState visible long enough to see between updates
      sleep(Duration(milliseconds: 500));
      if (controlBoard.changeDirection == true) {
        controlBoard.reverseDirection();
        //reset changeDirection
        controlBoard.changeDirection = false;
      }
      alien.updateAlienPositions(alien.alienPositions, controlBoard.direction);
    });
  }
  void endGame(){
    exit(0);
  }
}