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
  var direction = Board.right;
  var changeDirection = false;
  final player = Player();
  final board = Board();
  final alien = Alien();
  final userInput = UserInput();

  // initialize list of alien positions
  var alienPositions = await alien.initializeAlienPositions(Board.rows, Board.columns);
  stdout.flush();
   
  stdin.lineMode = false;
  stdin.echoMode = false;
  StreamController<List<int>> streamController = StreamController<List<int>>.broadcast();
  
  stdinStreamSubscription = stdin.listen((event) {
    // TODO: write tests for processUserInput
    event = userInput.processUserInput(event);
    final KeyTypes key = KeyTypes.fromValue(event);
    playerPosition = player.handlePlayerMove(key, playerPosition);
    streamController.add(event);
  });

  Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
    List<List<String>> boardState = List.generate((Board.rows), (_) => List.filled(Board.columns, ' '));
    await Future.delayed(Duration(milliseconds: 100));
    // clear the screen after displaying the boardState
    // TODO: possibly write tests for clearScreen function?
    board.clearScreen();
    // TODO: write tests for the updateboardState
    Map<String, dynamic> update = board.updateBoardState(alienPositions, boardState, changeDirection, playerPosition);
    changeDirection = update['changeDirection'];
    boardState = update['boardState'];
    // display the boardState after each update
    // TODO: write a test for this function?
    board.printBoardState(boardState);
    //sleep keeps the boardState visible long
    // enough to see between updates
    sleep(Duration(milliseconds: 500));
    if (changeDirection == true) {
    // TODO: if refactored into function, write tests
      direction = board.reverseDirection(direction);
      changeDirection = false;
    }
    // TODO: write tests for function
    alien.updateAlienPositions(alienPositions, direction);
    
  });

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  //TODO: add some kind of reset? that or endGame function
  stdout.flush();
}
