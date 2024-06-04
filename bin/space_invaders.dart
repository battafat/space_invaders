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
  // TODO: add reset command at beginning to make sure terminal is clear
  var controlBoard = Board();
  final alien = Alien();
  Map<String, List<String>> board = controlBoard.board;
  List<List<String>> alienRows = [
    board[Board.alienRow1]!,
    board[Board.alienRow2]!
  ];

  stdinStreamSubscription = stdin.listen((event) { });
  alien.aliensTraverseXaxis(board, 2, alienRows);
}






  


