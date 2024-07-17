import 'dart:math';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../bin/alien.dart';
import '../bin/board.dart';

class MockConfigWrapper extends ConfigWrapper {
  final int _mockValue;

  MockConfigWrapper(this._mockValue);

  @override
  int get staticValue => _mockValue;
}

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

  group('initializeAlienPositions tests', (){
    test('initializeAlienPositions odd', () {
      // Arrange
      final mockConfig = MockConfigWrapper(33);
      final alien = Alien(config: mockConfig);

      final positions = alien.alienPositions;
      // var positions = Alien().initializeAlienPositions();
      final initializedRows = [
        Point(0, 5),
        Point(0, 6),
        Point(0, 7),
        Point(0, 8),
        Point(0, 9),
        Point(1, 5),
        Point(1, 6),
        Point(1, 7),
        Point(1, 8),
        Point(1, 9),
        ];
      expect(
          positions, initializedRows);
    });
  });
}
