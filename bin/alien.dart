import "dart:async";
import "dart:core";

import "dart:math";
import "player.dart";
import "space_invaders.dart";
import "package:dart_console/dart_console.dart";
import 'dart:io';
import "board.dart";
import "key_types.dart";
import "user_input.dart";

class Alien {
  List<Point<int>> alienPositions;
  // initializer list
  Alien() : alienPositions = initializeAlienPositions();

// TODO: write tests for initializeAlienPositions
  static List<Point<int>> initializeAlienPositions(){
    List<Point<int>> alienPositions = [];
    for (var alienRow = 0; alienRow < 2; alienRow++) {
      for (var alienColumn = (Board.columns ~/ 3); alienColumn < 2 * (Board.columns ~/ 3); alienColumn++) {
        alienPositions.add(Point(alienRow, alienColumn));
      }
    }
    return alienPositions;
  }

  List<Point<int>> updateAlienPositions(
      List<Point<int>> alienPositions, int direction) {
    for (var i = 0; i < alienPositions.length; i++) {
      alienPositions[i] =
          Point(alienPositions[i].x, alienPositions[i].y + direction);
    }
    return alienPositions;
  }
}
