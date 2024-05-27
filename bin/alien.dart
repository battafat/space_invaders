import "package:dart_console/dart_console.dart";
import 'dart:io';
import "board.dart";

// function goes through the alien rows and shifts them right and then left across
// the screen. One iteration is considered shifting all the aliens so that the farthest
// to the right ends up in rightmost lastSpot before the border and then shifting
// the aliens all left until the leftmost alien occupies the leftmost spot next to
// the border.
class Alien {

  List<String> shiftAliensRight(List<String> row) {
    int rightmostIndex = row.length - 2;
    if (row[rightmostIndex] == Board.alien){
      // TODO: include error or throw. return row, but show an error.
      return row;
    }
    // TODO: refactor i value to not include border.
    // Todo: refactor i value into variable. Currently hard to read
    for (int i = row.length - 2; i >= 1; i--) {
      // when loop reaches leftmost coordinate,
      // it should be a space, not the border string

      if (i == 1) {
        row[i] = Board.space;
        continue;
      }
      if (i == rightmostIndex){
        if (row[i] == Board.alien){
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
      } if (row[i] == Board.border) {
        continue;
      } else {
        row[i] = row[i + 1];
      }
    }
    return row;
  }

  Map<String, List<String>> aliensTraverseXaxis(Map<String, List<String>> board, int iterations, List<List<String>> rows) {
    final console = Console();
    final alien = Alien();


    List<String> row = rows[0];
      // the last coordinate before the right-hand border
    int rightmostIndex = row.length - 2;
    int count = 0;
    while (count < iterations) {
      // print the board
      alien.printBoard(board);
      // pause the program before clearing the screen.
      // Otherwise, the screen disappears too quickly.
      sleep(Duration(seconds: 2));
      // Uses ANSI codes to erase the terminal display and reset the cursor.
      console.clearScreen();

      if (row[rightmostIndex] == Board.alien) {
        // once the aliens reach lastSpot, go left until they reach the firstSpot
        // while the aliens haven't yet reached the leftmost coordinate before the border
        while (row[1] != Board.alien) {
        // shift left if the leftmost coordinate isn't an alien
          
          shiftAliensLeft(row);
          shiftAliensLeft(rows[1]);
          
        // print the board
          alien.printBoard(board);
        // pause the program before clearing the screen.
        // Otherwise, the screen disappears too quickly.
          sleep(Duration(seconds: 2));
        // Uses ANSI codes to erase the terminal display and reset the cursor.
          console.clearScreen();
        }
      } else {
        //shift right if the aliens are as far left as possible
        
        shiftAliensRight(row);
        shiftAliensRight(rows[1]);
        // print the board
        alien.printBoard(board);
        // pause the program before clearing the screen.
        // Otherwise, the screen disappears too quickly.
        sleep(Duration(seconds: 2));
        // Uses ANSI codes to erase the terminal display and reset the cursor.
        console.clearScreen();
      }
      // if the first available coordinate is an alien, then the aliens have made one
      // full shift to the left. Add that to the count.
      if (row[1] == Board.alien) {
        count += 1;
      }
    }
    return board;
  }

  void printBoard(board){
    for (var r in board.values) {
      print(r.join(' '));
    }
  }


  
}