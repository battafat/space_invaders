import 'dart:collection';
import 'dart:convert';
import 'package:dart_console/dart_console.dart';
import 'alien.dart';
import 'board.dart';


void main() {
// repeat, while the player is alive
  var controlBoard = Board();
  final alien = Alien();
  Map<String, List<String>> board = controlBoard.board;
  
  List<List<String>> alienRows = [board[Board.alienRow1]!, board[Board.alienRow2]!];

  alien.aliensTraverseXaxis(board, 2, alienRows);
}






  


