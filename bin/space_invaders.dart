import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dart_console/dart_console.dart';
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

  // initialize list of alien positions
  // TODO: refactor the line below into alien.dart?
  // var alienPositions = alien.initializeAlienPositions();
  stdout.flush();
  // TODO: write startUserInput()
  stdin.lineMode = false;
  stdin.echoMode = false;
  StreamController<List<int>> streamController = StreamController<List<int>>.broadcast();
  
  stdinStreamSubscription = stdin.listen((keyPress) {
    // TODO: write tests for processUserInput
    final event = userInput.processUserInput(keyPress);
    final KeyTypes key = KeyTypes.fromValue(event);
    player.handlePlayerMove(key);
    streamController.add(event);
  });
  
  // TODO: Make this it's own gameLoop() ?
  Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
    await Future.delayed(Duration(milliseconds: 100));
    // clear the screen after displaying the boardState
    // TODO: possibly write tests for clearScreen function?
    controlBoard.clearScreen();
    // TODO: write tests for the updateboardState
    controlBoard.updateBoardState(alien.alienPositions, player.playerPosition);
    // display the boardState after each update
    // TODO: write a test for this function?
    controlBoard.printBoardState();
    // sleep keeps the boardState visible long enough to see between updates
    sleep(Duration(milliseconds: 500));
    if (controlBoard.changeDirection == true) {
    // TODO: if refactored into function, write tests
      controlBoard.reverseDirection();
      //reset changeDirection
      controlBoard.changeDirection = false;
    }
    // TODO: write tests for function
    alien.updateAlienPositions(alien.alienPositions, controlBoard.direction);
    
  });

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  //TODO: add some kind of reset? that or endGame function
  stdout.flush();
}
