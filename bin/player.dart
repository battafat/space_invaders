
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'board.dart';
import 'key_types.dart';
import 'space_invaders.dart';

class Player {

  KeyTypes left = KeyTypes.left;
  KeyTypes right = KeyTypes.right;
  Point<int> playerPosition = Point(Board.rows - 1, (Board.columns ~/ 2));

  void moveRight(){
    playerPosition = Point(playerPosition.x, playerPosition.y + 1);
  }

  void moveLeft(){
    playerPosition = Point(playerPosition.x, playerPosition.y - 1);
  }
  
  void handlePlayerMove(KeyTypes move){
    // if the playerPosition is all the way at the left
    // then they can't move left
    if (playerPosition.y == 0 && move == left){
      return;
    }
    // if the playerPosition is all the way at the right
    // then they can't move right
    if (playerPosition.y == Board.columns - 1 && move == right){
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