
import 'dart:async';
import 'dart:io';
import 'board.dart';
import 'key_types.dart';

class Player {

  KeyTypes left = KeyTypes.left;
  KeyTypes right = KeyTypes.right;


  List<String> moveRight(List<String> row){
    
    int rightmostIndex = row.length - 2;
    String rightmostSpot = row[rightmostIndex];
    if (rightmostSpot == Board.player){
      return row;
    }
    for (int i = row.length - 2; i >= 1; i--) {
      // when loop reaches leftmost coordinate,
      // it should be a space, not the border string

      if (i == 1) {
        row[i] = Board.space;
        continue;
      }
      if (i == rightmostIndex){
        if (row[i] == Board.player){
          break;
        }
      }
      if (row[i] == Board.border) {
        continue;
      } 
      else {
        row[i] = row[i - 1];
      }
    }
    return row;
  }
  List<String> moveLeft(List<String> row) {
      final leftmostIndex = 1;
      if (row[leftmostIndex] == Board.player) {
        // TODO: include error or throw. return row, but show an error.
        return row;
      }
      for (int i = 0; i < row.length; i++) {
        if (i == row.length - 2) {
          row[i] = Board.space;
          continue;
        }
        if (row[i] == Board.border) {
          continue;
        } else {
          row[i] = row[i + 1];
        }
      }
      return row;
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