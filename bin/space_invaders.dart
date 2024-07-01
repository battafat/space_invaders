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
Future<List<Point<int>>> initializeAlienPositions(int rows, int columns) async{
  List<Point<int>> alienPositions = [];
  for (var h = 0; h < 2; h++) {
    for (var i = (columns ~/ 3); i < 2 * (columns ~/ 3); i++) {
      alienPositions.add(Point(h, i));
    }
  }
  return alienPositions;
}
List<int> processUserInput(List<int> event){
  if (event.length >= 3 && event[1] == 91) {
    switch (event[2]) {
      // up arrow pressed
      case 65:
        event = [65];
        break;
      // down arrow pressed
      case 66:
        event = [66];
        break;
      // right arrow pressed
      case 67:
        event = [67];
        break;
      // left arrow pressed
      case 68:
        event = [68];
        break;
      default:
        print("Unknown escape sequence: $event");
    }
  }
  return event;
}

bool updateboardState(List<Point<int>> alienPositions, List<List<String>> boardState, bool changeDirection){
  for (var row = 0; row < Board.rows; row++) {
    for (var column = 0; column < Board.columns; column++) {
      if (alienPositions.contains(Point(row, column))) {
        boardState[row][column] = Board.alien;
        // check if aliens reached the rightmost index.
        if (column == Board.columns - 1) {
          changeDirection = true;
        }
        // check if aliens reached the leftmost index.
        if (column == 0) {
          changeDirection = true;
        }
      } else if (playerPosition == Point(row, column)) {
        boardState[row][column] = Board.player;
      } else {
        boardState[row][column] = Board.space;
      }
    }
  }
  return changeDirection;
}

void printboardState(List<List<String>> boardState){
  for (var x = 0; x < boardState.length; x++) {
    print(boardState[x].join());
  }
}

List<Point<int>> updateAlienPositions(List<Point<int>> alienPositions, int direction){
  for (var i = 0; i < alienPositions.length; i++) {
    alienPositions[i] =
        Point(alienPositions[i].x, alienPositions[i].y + direction);
  }
  return alienPositions;
}

void main() async {
  var direction = Board.right;
  // TODO: add reset command at beginning to make sure terminal is clear
  var changeDirection = false;
  final player = Player();
  final board = Board();

  // initialize list of alien positions
  var alienPositions = await initializeAlienPositions(Board.rows, Board.columns);
  stdout.flush();
   
  stdin.lineMode = false;
  stdin.echoMode = false;
  StreamController<List<int>> streamController = StreamController<List<int>>.broadcast();
  
  stdinStreamSubscription = stdin.listen((event) {
    // TODO: write tests for processUserInput
    event = processUserInput(event);
    final KeyTypes key = KeyTypes.fromValue(event);
    playerPosition = player.handlePlayerMove(key, playerPosition);
    streamController.add(event);
  });

  Timer.periodic(Duration(milliseconds: 700), (Timer timer) async {
    late List<List<String>> boardState = List.generate((Board.rows), (_) => List.filled(Board.columns, ' '));
    await Future.delayed(Duration(milliseconds: 100));
    // clear the screen after displaying the boardState
    // TODO: possibly write tests for clearScreen function?
    board.clearScreen();
    // TODO: write tests for the updateboardState
    changeDirection = updateboardState(alienPositions, boardState, changeDirection);
    // display the boardState after each update
    // TODO: write a test for this function?
    printboardState(boardState);
    //sleep keeps the boardState visible long
    // enough to see between updates
    sleep(Duration(milliseconds: 500));
    // TODO: if refactored into function, write tests
    if (changeDirection == true) {
      direction = board.validateDirection(direction);
      changeDirection = false;
    }
    // TODO: write tests for function
    updateAlienPositions(alienPositions, direction);
    
  });

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  //TODO: add some kind of reset? that or endGame function
  stdout.flush();
}
