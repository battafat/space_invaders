import 'dart:math';
import 'board.dart';
import 'key_types.dart';

class Player {
  KeyTypes left = KeyTypes.left;
  KeyTypes right = KeyTypes.right;
  static const leftmostPosition = 0;
  static const rightmostPosition = Board.columns - 1;
  Point<int> playerPosition = Point(Board.rows - 1, (Board.columns ~/ 2));

  void moveRight(){
    playerPosition = Point(playerPosition.x, playerPosition.y + 1);
  }

  void moveLeft(){
    playerPosition = Point(playerPosition.x, playerPosition.y - 1);
  }
  //used for testing
  void moveToLeftmost(){
    playerPosition = Point(playerPosition.x, leftmostPosition);
  }
 // used for testing
  void moveToRightmost(){
    playerPosition = Point(playerPosition.x, rightmostPosition);
  }
  
  void handlePlayerMove(KeyTypes move){
    // if the playerPosition is all the way at the left
    // then they can't move left
    if (playerPosition.y == leftmostPosition && move == left){
      return;
    }
    // if the playerPosition is all the way at the right
    // then they can't move right
    if (playerPosition.y == rightmostPosition && move == right){
      return;
    }

    if (move == right){
      return moveRight();
    }
    if (move == left){
      return moveLeft();
    }
  }
}