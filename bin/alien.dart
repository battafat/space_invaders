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

  @override
  String toString() {
    return 'ConfigWrapper(staticColumns: $staticColumns)';
  }
}

class Alien {
  final ConfigWrapper configWrapper;
  final List<Point<int>> alienPositions;
  
  Alien({ConfigWrapper? config})
      : configWrapper = config ?? ConfigWrapper(),
        alienPositions = [] {
        alienPositions.addAll(_initializeAlienPositions());
  }
  List<Point<int>> _initializeAlienPositions(){
    List<Point<int>> positions = [];
    for (var alienRow = 0; alienRow < 2; alienRow++) {
      // TODO: write guard clause for cases where staticColumns < 6.
      // if staticColumns = 5, 2 aliens each row
      // if staticColumns = 4, 1 aliens each row
      // if staticColumns = 3, 1 aliens each row
      // if (configWrapper.staticColumns / 3)
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