import 'dart:math';

import 'package:test/test.dart';

import '../bin/board.dart';

void main() {
  group('updateBoardState tests', () {
    test('updateBoardState, Column: 15, Row: 10, Player: Point(9,7)', () {
      // Arrange
      final controlBoard = Board();
      final alienPositions = [
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
        final playerPosition = Point(9, 7);

        List<List<String>> mockBoard = [
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.alien, Board.alien, Board.alien, Board.alien, Board.alien, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.alien, Board.alien, Board.alien, Board.alien, Board.alien, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space], 
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],       
          [Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.player, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space, Board.space],        
        ];

      // Act
      controlBoard.updateBoardState(alienPositions, playerPosition);

      // Assert
      expect(controlBoard.boardState, mockBoard);
    });
  });
}
