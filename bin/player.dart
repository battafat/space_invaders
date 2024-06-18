
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'board.dart';
import 'key_types.dart';

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

  
  List<String> checkMove(List<String> playerRow, KeyTypes move){
    if (move == right){
      return moveRight(playerRow);
    }
    if (move == left){
      return moveLeft(playerRow);
    }
    return playerRow;
  }
  


  
// https://api.flutter.dev/flutter/services/LogicalKeyboardKey-class.html

  // String playerMove (playerRow){
  //   var move = stdin.readLineSync();    
  //   // var move = stdin.asBroadcastStream(onListen: Future.value);
  //   // print(line?.trim() == 'f' ? 'moved right!' : 'Nope :(');
  //   // result = player. ('f ? player.moveRight(row) : 'Nope :(');
  //   return move!;

  // }
}
  // final controlBoard = Board();
  //   final playerRow = controlBoard.board[Board.playerRow];
  
// }