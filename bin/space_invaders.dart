import 'dart:collection';
import 'dart:convert';
import 'package:dart_console/dart_console.dart';
import 'alien.dart';
import 'board.dart';


void main() {
// repeat, while the player is alive
  var controlBoard = Board();
  Map<String, List<String>> board = controlBoard.board;
  print('alienRow1 should = ${controlBoard.getRow(Board.alienRow1)}');
  // List<List<String>> alienRows = [controlBoard.getRow(Board.alienRow1)!, controlBoard.getRow(Board.alienRow2)!];
  
  List<List<String>> alienRows = [board[Board.alienRow1]!, board[Board.alienRow2]!];
  // aliensTraverseXaxis(board, 2, alienRows);
  var row = alienRows[0];
  print('initial row: ');
  print(row);






// TODO: write tests for left and right shift
  // TODO: maybe you have to print out here?

}






  


