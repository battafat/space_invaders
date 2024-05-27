class Directions {

  String left = 's';
  String right = 'f';
  var direction = Directions();
  
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