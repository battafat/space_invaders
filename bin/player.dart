
import 'board.dart';

class Player {

  String left = 's';
  String right = 'f';
  var direction = Player();


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
  
  List<int> assignMove(input) {
    
    if (String input == Directions.left){
      return [0, -1];
    }
    else if (String input == Directions.right){
      return [0, 1];
    }
    else{
      return [0, 0];
    }
  }

}

//   String checkMove() async {
//     // var line = stdin.readLineSync();
//     var line = stdin.asBroadcastStream(onListen: );
//     print(line?.trim() == 'f' ? 'moved right!' : 'Nope :(');
//     return line?.

//   }
  
// }