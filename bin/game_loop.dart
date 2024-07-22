import 'dart:async';
import 'dart:io';
import 'alien.dart';
import 'board.dart';
import 'player.dart';

class GameLoop {
  void runGameLoop(Board controlBoard, Alien alien, Player player){
    Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
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
}