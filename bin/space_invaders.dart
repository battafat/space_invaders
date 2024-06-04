import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'alien.dart';
import 'board.dart';
import 'key_types.dart';
import 'player.dart';
import 'user_input.dart';

late final StreamSubscription<List<int>> stdinStreamSubscription;

void main() async{
  var controlBoard = Board();
  final alien = Alien();
  final player = Player();
  final rowName = Board.playerRow;
  stdinStreamSubscription = stdin.listen((event) { });
  // late final StreamSubscription<List<int>> stdinStreamSubscription;
  Map<String, List<String>> board = controlBoard.board;
  // List<String>? playerRow = board[rowName];
  

  
  List<List<String>> alienRows = [
    board[Board.alienRow1]!,
    board[Board.alienRow2]!
  ];
  
  
// repeat, while the player is alive
  
  // TODO: add ANSI for reset command at beginning to make sure terminal is clear
  // or whatever command is appropriate
  
  
  // }
  

  
  // final playerRow = controlBoard.board[Board.playerRow];
  // var move = player.playerMove;
  // player.checkMove(playerRow!, move.toString());
  alien.aliensTraverseXaxis(board, 2, alienRows);
  // print(move);

}






  


