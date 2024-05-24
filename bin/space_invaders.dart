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
  List<List<String>?> alienRows = [controlBoard.getRow(Board.alienRow1), controlBoard.getRow(Board.alienRow2)];
  // aliensTraverseXaxis(2, alienRows);
  for (var row in alienRows){
    shiftAliensRight(board, row!);
  }
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