import 'dart:math';

class Board {
  static const space = ' ';
  static const alien = '@';
  static const border = '|';
  static const player = '^';
  static const rows = 10;
  static const columns = 15;
  static const right = 1;
  static const left = -1;
  bool changeDirection = false;
  List<List<String>> boardState = List.generate((Board.rows), (_) => List.filled(Board.columns, ' '));
  int direction = right;

  void clearScreen() {
      print('\x1B[2J\x1B[H');
  }

  void reverseDirection() {
    if (direction == right) {
      direction = left;
    } else {
      direction = right;
    }
  }

  void updateBoardState(List<Point<int>> alienPositions,
      Point<int> playerPosition) {
    for (var row = 0; row < Board.rows; row++) {
      for (var column = 0; column < Board.columns; column++) {
        if (alienPositions.contains(Point(row, column))) {
          boardState[row][column] = Board.alien;
          // check if aliens reached either the rightmost or leftmost index.
          // TODO: write test for isChangeDirection
          changeDirection = isChangeDirection(column);
        } else if (playerPosition == Point(row, column)) {
          boardState[row][column] = Board.player;
        } else {
          boardState[row][column] = Board.space;
        }
      }
    }
  }

  bool isChangeDirection(int column){
    if (column == Board.columns - 1) {
      return changeDirection = true;
    }
    // check if aliens reached the leftmost index.
    if (column == 0) {
      return changeDirection = true;
    }
    return changeDirection;
  }
  
  void printBoardState() {
    for (var x = 0; x < boardState.length; x++) {
      print(boardState[x].join());
    }
  }
}




  
  

