import "dart:async";
import "space_invaders.dart";
import "package:dart_console/dart_console.dart";
import 'dart:io';
import "board.dart";
import "key_types.dart";
import "user_input.dart";

class Alien {
  // iterates through the row in reverse, setting each index equal to
  // the previous index.
  List<String> shiftAliensRight(List<String> row) {
    int rightmostIndex = row.length - 2;
    if (row[rightmostIndex] == Board.alien) {
      // TODO: include error or throw. return row, but show an error, but not to user?
      return row;
    }
    // Todo: refactor i value into variable. Currently hard to read
    for (int i = row.length - 2; i >= 1; i--) {
      // when loop reaches leftmost coordinate,
      // it should be a space, not the border string

      if (i == 1) {
        row[i] = Board.space;
        continue;
      }
      if (i == rightmostIndex) {
        if (row[i] == Board.alien) {
          break;
        }
      }
      if (row[i] == Board.border) {
        continue;
      } else {
        row[i] = row[i - 1];
      }
    }
    return row;
  }

  List<String> shiftAliensLeft(List<String> row) {
    final leftmostIndex = 1;
    if (row[leftmostIndex] == Board.alien) {
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

// aliensTraverseXaxis goes through the alien rows and shifts them right and then left across
// the screen. One iteration is considered shifting all the aliens so that the alien farthest
// to the right ends up in the row's rightmost index before the border. And then the aliens
// all shift left until the leftmost alien occupies the leftmost index next to the border (row[1]).

  Map<String, List<String>> aliensTraverseXaxis(
      Map<String, List<String>> board,
      int iterations,
      List<List<String>> rows,
      ) {
    

    List<String> row = rows[0];
    // the last coordinate before the right-hand border
    int rightmostIndex = row.length - 2;
    int count = 0;
    resetFrame(board);
    while (count < iterations) {
      if (row[rightmostIndex] == Board.alien) {
        // once the aliens reach lastSpot, go left until they reach the firstSpot
        // while the aliens haven't yet reached the leftmost coordinate before the border
        while (row[1] != Board.alien) {
          // shift left if the leftmost coordinate isn't an alien

          shiftAliensLeft(row);
          shiftAliensLeft(rows[1]);

          resetFrame(board);
        }
      } else {
        //shift right if the aliens are as far left as possible
        shiftAliensRight(row);
        shiftAliensRight(rows[1]);

        resetFrame(board);
      }
      // if the first available coordinate is an alien, then the aliens have made one
      // full shift to the left. Add that to the count.
      if (row[1] == Board.alien) {
        count += 1;
      }
    }
    return board;
  }

  void printBoard(board) {
    for (var r in board.values) {
      print(r.join(' '));
    }
  }

  void resetFrame(board) {
    
    final alien = Alien();
    final console = Console();
    // final stream = KeystrokeStream().stream;
    // stream.listen((event) {
    //   final key = KeyTypes.fromValue(event);
      
    // });
    
    // stdinStreamSubscription.pause();
    // stdinStreamSubscription.onData((data) {
    //   final key = KeyTypes.fromValue(data);
    //   handleKeyEvent(key, board[Board.playerRow]!);
    //   print(key);
    //   });
    
    
    
    
    // print the board
    alien.printBoard(board);
    // pause the program before clearing the screen.
    // Otherwise, the screen disappears too quickly.
    sleep(Duration(seconds: 2));
    // Uses ANSI codes to erase the terminal display and reset the cursor.
    console.clearScreen();
    stdinStreamSubscription.resume();
  }
}
