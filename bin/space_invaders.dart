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
const rows = 10;
const columns = 15;
const right = 1;
const left = -1;
var playerPosition = Point(rows - 1, (columns ~/ 2));
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

bool updateBoard(List<Point<int>> alienPositions, List<List<String>> board, bool changeDirection){
  for (var row = 0; row < rows; row++) {
    for (var column = 0; column < columns; column++) {
      if (alienPositions.contains(Point(row, column))) {
        board[row][column] = Board.alien;
        // check if aliens reached the rightmost index.
        if (column == columns - 1) {
          changeDirection = true;
        }
        // check if aliens reached the leftmost index.
        if (column == 0) {
          changeDirection = true;
        }
      } else if (playerPosition == Point(row, column)) {
        board[row][column] = Board.player;
      } else {
        board[row][column] = Board.space;
      }
    }
  }
  return changeDirection;
}

void printBoard(List<List<String>> board){
  for (var x = 0; x < board.length; x++) {
    print(board[x].join());
  }
}

void main() async {
  var direction = right;
  // TODO: add reset command at beginning to make sure terminal is clear
  var changeDirection = false;
  final player = Player();
  // initialize list of alien positions
  var alienPositions = await initializeAlienPositions(rows, columns);
  
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
    late List<List<String>> board = List.generate((rows), (_) => List.filled(columns, ' '));
    await Future.delayed(Duration(milliseconds: 100));
    // clear the screen after displaying the board
    // TODO: refactor into clearScreen function
    // TODO: possibly write tests for clearScreen function?
    print('\x1B[2J\x1B[H');
    // TODO: write tests for the function
    changeDirection = updateBoard(alienPositions, board, changeDirection);
    // display the board after each update
    // TODO: write a test for this function?
    printBoard(board);
    //sleep keeps the board visible long
    // enough to see between updates
    sleep(Duration(milliseconds: 500));
    // await Future.delayed(Duration(seconds: 2));
    // TODO: refactor this if statement into updateDirection?
    // TODO: if refactored into function, write tests
    if (changeDirection == true){
      if (direction == right){
        direction = left;
      }
      else {
        direction = right;
      }
      changeDirection = false;
    }
    // TODO: refactor into function updateAlienPositions
    // TODO: write tests for function
    for (var i = 0; i < alienPositions.length; i++){
      alienPositions[i] = Point(alienPositions[i].x, alienPositions[i].y + direction);
    }
  });

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  stdout.flush();
}
