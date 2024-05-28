import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/player.dart';

void main () {
  group('moveRight tests', (){
    test('moveRight, player at row[1]', (){
      final player = Player();
      final rowIn = ['|', '^', ' ', ' ', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', '^', ' ', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
    test('moveRight, player at row[2]', () {
      final player = Player();
      final rowIn = ['|', ' ', '^', ' ', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', ' ', '^', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
    test('moveRight, player at row[3]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', '^', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', ' ', ' ', '^', ' ', ' ', ' ', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
    test('moveRight, player at row[4]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', '^', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', ' ', ' ', ' ', '^', ' ', ' ', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
    test('moveRight, player at row[5]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', ' ', '^', ' ', ' ', '|'];
      final rowOut = ['|', ' ', ' ', ' ', ' ', ' ', '^', ' ', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
    test('moveRight, player at row[6]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', ' ', ' ', '^', ' ', '|'];
      final rowOut = ['|', ' ', ' ', ' ', ' ', ' ', ' ', '^', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
    test('moveRight, player at row[7]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', ' ', ' ', ' ', '^', '|'];
      final rowOut = ['|', ' ', ' ', ' ', ' ', ' ', ' ', '^', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
  });
  group('moveLeft tests', (){
    test('moveLeft, player at row[1]', (){
      final player = Player();
      final rowIn = ['|', '^', ' ', ' ', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', '^', ' ', ' ', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });
    test('moveLeft, player at row[2]', () {
      final player = Player();
      final rowIn = ['|', ' ', '^', ' ', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', '^', ' ', ' ', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });
    test('moveLeft, player at row[3]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', '^', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', '^', ' ', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });
    test('moveLeft, player at row[4]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', '^', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', ' ', '^', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });
    test('moveLeft, player at row[5]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', ' ', '^', ' ', ' ', '|'];
      final rowOut = ['|', ' ', ' ', ' ', '^', ' ', ' ', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });
    test('moveLeft, player at row[6]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', ' ', ' ', '^', ' ', '|'];
      final rowOut = ['|', ' ', ' ', ' ', ' ', '^', ' ', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });
    test('moveLeft, player at row[7]', () {
      final player = Player();
      final rowIn = ['|', ' ', ' ', ' ', ' ', ' ', ' ', '^', '|'];
      final rowOut = ['|', ' ', ' ', ' ', ' ', ' ', '^', ' ', '|'];
      final actual = player.moveLeft(rowIn);
      expect(actual, rowOut);
    });

  });
}