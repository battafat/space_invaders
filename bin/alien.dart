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
// TODO: write tests for initializeAlienPositions
  Future<List<Point<int>>> initializeAlienPositions() async {
    List<Point<int>> alienPositions = [];
    // TODO: look up if there's a generic for grid variable names
    for (var alienRow = 0; alienRow < 2; alienRow++) {
      for (var alienColumn = (Board.columns ~/ 3); alienColumn < 2 * (Board.columns ~/ 3); alienColumn++) {
        alienPositions.add(Point(alienRow, alienColumn));
      }
    }
    return alienPositions;
  }
// TODO: write tests for updateAlienPositions
  List<Point<int>> updateAlienPositions(
      List<Point<int>> alienPositions, int direction) {
    for (var i = 0; i < alienPositions.length; i++) {
      alienPositions[i] =
          Point(alienPositions[i].x, alienPositions[i].y + direction);
    }
    return alienPositions;
  }
}
