import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/alien.dart';
import '../bin/board.dart';

void main (){
  group('updateAlienPositions tests', (){
    test('updateAlienPositions right', () {
      final alien = Alien();
      final List<Point<int>> alienPositions = [
        Point(0, 1),
        Point(0, 2),
        Point(0, 3),
        Point(0, 4),
        Point(0, 5)
      ];
      final updatedRow = [
        Point(0, 2),
        Point(0, 3),
        Point(0, 4),
        Point(0, 5),
        Point(0, 6)
      ];
      expect(
          alien.updateAlienPositions(alienPositions, Board.right), updatedRow);
    });

    test('updateAlienPositions left', () {
      final alien = Alien();
      final alienPositions = [
        Point(0, 2),
        Point(0, 3),
        Point(0, 4),
        Point(0, 5),
        Point(0, 6)
      ];
      final List<Point<int>> updatedRow = [
        Point(0, 1),
        Point(0, 2),
        Point(0, 3),
        Point(0, 4),
        Point(0, 5)
      ];
      expect(
          alien.updateAlienPositions(alienPositions, Board.left), updatedRow);
    });
  });
}

