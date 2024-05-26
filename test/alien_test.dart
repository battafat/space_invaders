import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/alien.dart';
import '../bin/board.dart';

void main (){
  test('alienRow1 values should shift right', (){
    final alien = Alien();
    final boardClass = Board();
    final board = boardClass.board;
    final alienRow1 = board[Board.alienRow1];
    expect(alien.shiftAliensRight(board, alienRow1!), ['|', ' ', ' ', ' ', '@', '@', '@', ' ', '|']);
  });
}