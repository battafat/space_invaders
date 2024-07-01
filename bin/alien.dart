import "dart:async";
import "dart:math";
import "player.dart";
import "space_invaders.dart";
import "package:dart_console/dart_console.dart";
import 'dart:io';
import "board.dart";
import "key_types.dart";
import "user_input.dart";

class Alien {
  Future<List<Point<int>>> initializeAlienPositions(
      int rows, int columns) async {
    List<Point<int>> alienPositions = [];
    for (var h = 0; h < 2; h++) {
      for (var i = (columns ~/ 3); i < 2 * (columns ~/ 3); i++) {
        alienPositions.add(Point(h, i));
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
