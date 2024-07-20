import 'dart:async';
import 'dart:io';
import 'alien.dart';
import 'board.dart';
import 'key_types.dart';
import 'player.dart';
import 'user_input.dart';

late final StreamSubscription<List<int>> stdinStreamSubscription;

void main() async {
  // TODO: add reset command at beginning to make sure terminal is clear
  final player = Player();
  final controlBoard = Board();
  final alien = Alien();
  final userInput = UserInput();

  stdout.flush();
  // TODO: write startUserInput()
  userInput.startUserInput(player);
  
  
  // TODO: Make this it's own gameLoop() ?
  Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
    await Future.delayed(Duration(milliseconds: 100));
    // clear the screen after displaying the boardState
    // TODO: possibly write tests for clearScreen function?
    controlBoard.clearScreen();
    controlBoard.updateBoardState(alien.alienPositions, player.playerPosition);
    // display the boardState after each update
    // TODO: write a test for this function?
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

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  //TODO: add some kind of reset? that or endGame function
  stdout.flush();
}
