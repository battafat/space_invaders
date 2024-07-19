import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/board.dart';
import '../bin/key_types.dart';
import '../bin/player.dart';

void main () {
  group('moveRight tests', (){
    test('moveRight', () {
      // arrange
      final player = Player();
      final initialPosition = player.playerPosition;
      //act
      player.moveRight();
      // assert
      final newPosition = player.playerPosition;
      expect(newPosition, (Point(initialPosition.x, initialPosition.y + 1)));
    });
  });
  group('moveLeft tests', (){
    test('moveLeft', () {
      // arrange
      final player = Player();
      final initialPosition = player.playerPosition;
      print('initial positions: $initialPosition');
      //act
      player.moveLeft();
      // assert
      final newPosition = player.playerPosition;
      print('new position: $newPosition');
      expect(newPosition, (Point(initialPosition.x, initialPosition.y - 1)));
    });
  });
  group('handlePlayerMove tests', () {
    test('handlePlayerMove, player at leftmost position', () {
      // arrange
      final player = Player();
      final move = KeyTypes.left;
      // TODO: make a leftmost position in player?
      player.moveToLeftmost();
      print('playerPosition : ${player.playerPosition}');
      final playerAtLeftmost = player.playerPosition;
      //act
      player.handlePlayerMove(move);
      // assert
      // if the move is left and the player is in the leftMost position,
      // playerPosition should still be leftmost after handlePlayerMove runs.
      expect(playerAtLeftmost, player.playerPosition); 
    });
  });
}