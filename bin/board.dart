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
  
  void clearScreen() {
      print('\x1B[2J\x1B[H');
  }

  int validateDirection(int direction) {
    if (direction == right) {
      direction = left;
    } else {
      direction = right;
    }
    return direction;
  }
  
  bool updateBoardState(List<Point<int>> alienPositions,
      List<List<String>> boardState, bool changeDirection, Point<int> playerPosition) {
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
}




  
  

