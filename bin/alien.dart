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

class ConfigWrapper {
  int get staticColumns => Board.columns;
}


class Alien {
  final ConfigWrapper configWrapper;
  final List<Point<int>> alienPositions;
  
  Alien() : configWrapper = ConfigWrapper(),
            alienPositions = [] {
            alienPositions.addAll(initializeAlienPositions());
            }
// TODO: write tests for initializeAlienPositions
  List<Point<int>> initializeAlienPositions(){
    List<Point<int>> positions = [];
    for (var alienRow = 0; alienRow < 2; alienRow++) {
      for (var alienColumn = (configWrapper.staticColumns ~/ 3); alienColumn < 2 * (configWrapper.staticColumns ~/ 3); alienColumn++) {
        positions.add(Point(alienRow, alienColumn));
      }
    }
    return positions;
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