import 'dart:math';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
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
    test('handlePlayerMove, player at leftmost position, move = left', () {
      // arrange
      final player = Player();
      final move = KeyTypes.left;
      // TODO: make a leftmost position in player?
      player.moveToLeftmost();
      final playerAtLeftmost = player.playerPosition;
      //act
      player.handlePlayerMove(move);
      // assert
      // if the move is left and the player is in the leftMost position,
      // playerPosition should still equal leftmost after handlePlayerMove runs.
      expect(playerAtLeftmost, player.playerPosition); 
    });
    test('handlePlayerMove, player at rightmost position, move = right', () {
      // arrange
      final player = Player();
      final move = KeyTypes.right;
      // TODO: make a leftmost position in player?
      player.moveToRightmost();
      final playerAtRightmost = player.playerPosition;
      //act
      player.handlePlayerMove(move);
      // assert
      // if the move is right and the player is in the rightMost position,
      // playerPosition should still equal rightmost after handlePlayerMove runs.
      expect(player.playerPosition, playerAtRightmost);
    });
    test('handlePlayerMove, move = right', () {
      // arrange
      final player = Player();
      final move = KeyTypes.right;
      // TODO: make a leftmost position in player?
      final initialPlayerPosition = player.playerPosition;
      final matcher = Point(initialPlayerPosition.x, initialPlayerPosition.y + 1);
      //act
      player.handlePlayerMove(move);
      // assert
      expect(player.playerPosition, matcher);
    });
    test('handlePlayerMove, move = left', () {
      // arrange
      final player = Player();
      final move = KeyTypes.left;
      // TODO: make a leftmost position in player?
      final initialPlayerPosition = player.playerPosition;
      final matcher =
          Point(initialPlayerPosition.x, initialPlayerPosition.y - 1);
      //act
      player.handlePlayerMove(move);
      // assert
      expect(player.playerPosition, matcher);
    });
  });
}