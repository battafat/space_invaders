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

var playerPosition = Point(Board.rows - 1, (Board.columns ~/ 2));

void main() async {
  // TODO: add reset command at beginning to make sure terminal is clear
  final player = Player();
  final controlBoard = Board();
  
  final alien = Alien();
  final userInput = UserInput();

  // initialize list of alien positions
  var alienPositions = await alien.initializeAlienPositions(Board.rows, Board.columns);
  stdout.flush();
   
  stdin.lineMode = false;
  stdin.echoMode = false;
  StreamController<List<int>> streamController = StreamController<List<int>>.broadcast();
  
  stdinStreamSubscription = stdin.listen((keyPress) {
    // TODO: write tests for processUserInput
    final event = userInput.processUserInput(keyPress);
    final KeyTypes key = KeyTypes.fromValue(event);
    playerPosition = player.handlePlayerMove(key, playerPosition);
    streamController.add(event);
  });

  
  Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
    await Future.delayed(Duration(milliseconds: 100));
    // clear the screen after displaying the boardState
    // TODO: possibly write tests for clearScreen function?
    controlBoard.clearScreen();
    // TODO: write tests for the updateboardState
    controlBoard.updateBoardState(alienPositions, playerPosition);
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
    alien.updateAlienPositions(alienPositions, controlBoard.direction);
    
  });

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  //TODO: add some kind of reset? that or endGame function
  stdout.flush();
}
