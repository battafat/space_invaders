import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/alien.dart';
import '../bin/board.dart';

void main (){
  // alien tests start at row[0] and end at row[row.length - 1] because:
  // the border '|' occupies row[0] and row[row.length-1].
  // So leftmost possible alien coordinate is row[1].
  // And rightmost possible alien coordinate is row[row.len - 2].
  group('alienShiftRight tests', (){
    test('alienShiftRight called when already rightmost aligned', (){
      final alien = Alien();
      final alienRow1 = ['|', ' ', ' ', ' ', ' ', '@', '@', '@', '|'];
      const updatedRow = ['|', ' ', ' ', ' ', ' ', '@', '@', '@', '|'];
      expect(alien.shiftAliensRight(alienRow1), updatedRow);
    });
    test('aliensShiftRight aliens start row[1]', () {
      final alien = Alien();
      final alienRow1 = ['|', '@', '@', '@', ' ', ' ', ' ', ' ', '|'];
      const updatedRow = ['|', ' ', '@', '@', '@', ' ', ' ', ' ', '|'];
      expect(alien.shiftAliensRight(alienRow1), updatedRow);
    });
    test('aliensShiftRight aliens start row[2]', () {
      final alien = Alien();
      final alienRow1 = ['|', ' ', '@', '@', '@', ' ', ' ', ' ', '|'];
      const updatedRow = ['|', ' ', ' ', '@', '@', '@', ' ', ' ', '|'];
      expect(alien.shiftAliensRight(alienRow1), updatedRow);
    });
    test('alienShiftRight aliens start row[3]', () {
      final alien = Alien();
      final boardClass = Board();
      final board = boardClass.board;
      final alienRow1 = board[Board.alienRow1];
      const updatedRow = ['|', ' ', ' ', ' ', '@', '@', '@', ' ', '|'];
      expect(alien.shiftAliensRight(alienRow1!), updatedRow);
    });

    test('aliensShiftRight aliens start row[4]', (){
      final alien = Alien();
      final alienRow1 = ['|', ' ', ' ', ' ', '@', '@', '@', ' ', '|'];
      const updatedRow = ['|', ' ', ' ', ' ', ' ', '@', '@', '@', '|'];
      expect(alien.shiftAliensRight(alienRow1), updatedRow);
    });

  });

  group('shiftAliensLeft tests', (){

    test('aliensShiftLeft, aliens start row[2]', () {
      final alien = Alien();
      final alienRow1 = ['|', ' ', '@', '@', '@', ' ', ' ', ' ', '|'];
      const updatedRow = ['|', '@', '@', '@', ' ', ' ', ' ', ' ', '|'];
      expect(alien.shiftAliensLeft(alienRow1), updatedRow);
    });
    test('aliensShiftLeft, aliens start row[1]', () {
      final alien = Alien();
      final alienRow1 = ['|', '@', '@', '@', ' ', ' ', ' ', ' ', '|'];
      const updatedRow = ['|', '@', '@', '@', ' ', ' ', ' ', ' ', '|'];
      expect(alien.shiftAliensLeft(alienRow1), updatedRow);
    });
  });

  
}

