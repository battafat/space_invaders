import "dart:core";
import "dart:math";
import "board.dart";

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