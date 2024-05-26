import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/alien.dart';
import '../bin/board.dart';

void main (){
  test('original alien right shift', (){
    final alien = Alien();
    final boardClass = Board();
    final board = boardClass.board;
    final alienRow1 = board[Board.alienRow1];
    const updatedRow = ['|', ' ', ' ', ' ', '@', '@', '@', ' ', '|'];
    expect(alien.shiftAliensRight(alienRow1!), updatedRow);
  });

  test('second alien right shift', (){
    final alien = Alien();
    final alienRow1 = ['|', ' ', ' ', ' ', '@', '@', '@', ' ', '|'];
    const updatedRow = ['|', ' ', ' ', ' ', ' ', '@', '@', '@', '|'];
    expect(alien.shiftAliensRight(alienRow1), updatedRow);
  });
}