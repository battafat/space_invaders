import 'dart:io';
import 'key_types.dart';
import 'player.dart';
import 'space_invaders.dart';

class UserInput {
  // select the unique ASCII code from the list of codes
  List<int> processUserInput(List<int> event) {
    if (event[0] == 27) {
      if (event.length == 3 && event[1] == 91) {
        switch (event[2]) {
          // up arrow pressed
          case 65:
            event = [65];
            break;
          // down arrow pressed
          case 66:
            event = [66];
            break;
          // right arrow pressed
          case 67:
            event = [67];
            break;
          // left arrow pressed
          case 68:
            event = [68];
            break;
          default:
            print("Unknown escape sequence: $event");
        }
      }
    }
    return event;
  }

  void startUserInput(Player player){
    stdin.lineMode = false;
    stdin.echoMode = false;
  
    stdinStreamSubscription = stdin.listen((keyPress) {
      final event = processUserInput(keyPress);
      final KeyTypes key = KeyTypes.fromValue(event);
      player.handlePlayerMove(key);
    });
  }
}





    