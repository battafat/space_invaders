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

  int reverseDirection(int direction) {
    if (direction == right) {
      direction = left;
    } else {
      direction = right;
    }
    return direction;
  }

  Map<String, Object> updateBoardState(List<Point<int>> alienPositions,
      List<List<String>> boardState, bool changeDirection, Point<int> playerPosition) {
    for (var row = 0; row < Board.rows; row++) {
      for (var column = 0; column < Board.columns; column++) {
        if (alienPositions.contains(Point(row, column))) {
          boardState[row][column] = Board.alien;
          // check if aliens reached either the rightmost or leftmost index.
          changeDirection = isChangeDirection(column, changeDirection);
        } else if (playerPosition == Point(row, column)) {
          boardState[row][column] = Board.player;
        } else {
          boardState[row][column] = Board.space;
        }
      }
    }

    return {'changeDirection': changeDirection, 'boardState': boardState};
  }

  bool isChangeDirection(int column, bool changeDirection){
    if (column == Board.columns - 1) {
      return changeDirection = true;
    }
    // check if aliens reached the leftmost index.
    if (column == 0) {
      return changeDirection = true;
    }
    return changeDirection;
  }
  
  void printBoardState(List<List<String>> boardState) {
    for (var x = 0; x < boardState.length; x++) {
      print(boardState[x].join());
    }
  }
}




  
  

