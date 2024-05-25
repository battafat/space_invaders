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
  aliensTraverseXaxis(board, 2, alienRows);
  var row = alienRows[0];






// TODO: write tests for left and right shift
  // Map<String, List<String>> printableLeft = shiftAliensLeft(board, row);
  // for (var y in board.values){
  //   print(y);
  // }

  // Map<String, List<String>> printableRight = shiftAliensRight(board, row);
  // print("board: ");
  // for (var x in board.values){
  //   print(x);
  // }
  // print("printableRight: ");
  // for (var inst in printableRight.values) {
  //   print(inst);
  // }
  // printableRight = shiftAliensRight(printableRight, row);
  // for (var inst in printableRight.values) {
  //   print(inst);
  // }
  // TODO: maybe you have to print out here?

}

// blank space
// aliens
//
// vertex needs coordinates and



// class Directions {

//   String left = 's';
//   String right = 'f';
//   var direction = Directions();
//   List<int> assignMove(input) {
//     if (String input == Directions.left){
//       return [0, -1];
//     }
//     else if (String input == Directions.right){
//       return [0, 1];
//     }
//     else{
//       return [0, 0];
//     }
//   }


  


//   String checkMove() async {
//     // var line = stdin.readLineSync();
//     var line = stdin.asBroadcastStream(onListen: );
//     print(line?.trim() == 'f' ? 'moved right!' : 'Nope :(');
//     return line?.

//   }
  
// }