
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'board.dart';
import 'key_types.dart';
import 'space_invaders.dart';

class Player {

  KeyTypes left = KeyTypes.left;
  KeyTypes right = KeyTypes.right;

  Point<int> moveRight(Point<int> playerPosition){
    final updatedPosition = Point(playerPosition.x, playerPosition.y + 1);
    return updatedPosition;
  }

  Point<int> moveLeft(Point<int> playerPosition){
    final updatedPosition = Point(playerPosition.x, playerPosition.y - 1);
    return updatedPosition;
  }
  
  Point<int> checkMove(KeyTypes move, Point<int> playerPosition){
    // if the playerPosition is all the way at the left
    // then they can't move left
    if (playerPosition.x == 0 && move == left){
      return playerPosition;
    }
    // if the playerPosition is all the way at the right
    // then they can't move right
    if (playerPosition.x == columns - 1 && move == right){
      return playerPosition;
    }

    if (move == right){
      return moveRight(playerPosition);
    }
    if (move == left){
      return moveLeft(playerPosition);
    }
    return playerPosition;
  }
}