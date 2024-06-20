import 'dart:io';

import 'package:dart_console/dart_console.dart';

import 'board.dart';

void playInvaders(board) {
  int counter = 1;
  for (var i = 0; i < 3; i++) {
    // var direction = Directions();
    // makeBoard(rows, cols);
    // direction.handlePlayerMove();
    final screen = Board();
    screen.displayBoard();
    // print(screen.board["alien"]);
    String message = 'Frame number: $counter';
    print(message);
    counter += 1;
    print(counter);
    sleep(Duration(seconds: 2));
    // Uses ANSI codes to erase the display and reset the cursor.
    Console().clearScreen();
  }
}
