import "board.dart";

Map<String, List<String>> aliensTraverseXaxis(int iterations, List rows){
  var boardClass = Board();
  var mainBoard = boardClass.board;
  int count = 0;
  while (count < iterations) {
    if (mainBoard[boardClass.alienRow1]
            ?[mainBoard[boardClass.alienRow1]!.length - 2] ==
        Board.alien) {
      // would it be better to use the bang operator instead of ?
      while (mainBoard[boardClass.alienRow1]?[1] != Board.alien) {
        for (var row in rows) {
        shiftAliensLeft(mainBoard, row);
        shiftAliensLeft(mainBoard, row);
        }
        for (var r in mainBoard.values) {
          print(r.join(' '));
        }
      }
    } else {
      for (var row in rows) {
        shiftAliensRight(mainBoard, row);
        shiftAliensRight(mainBoard, row);
      }
      for (var r in mainBoard.values) {
        print(r.join(' '));
      }
    }
    for (var row in rows)
    {if (mainBoard[row]?[1] == Board.alien) {
      count += 1;
    }}
  }
  return mainBoard;
}

Map<String, List<String>> shiftAliensRight(
    Map<String, List<String>> newBoard1, String rowKey) {
  var newBoard = newBoard1;
  // TODO: refactor i value to not include border.
  // Todo: refactor i value into variable. Currently hard to read
  for (int i = newBoard[rowKey]!.length - 1; i >= 0; i--) {
    if (i == 1) {
      newBoard[rowKey]![i] = Board.space;
      continue;
    } else if (newBoard[rowKey]![i] == Board.border) {
      continue;
    } else {
      newBoard[rowKey]![i] = newBoard[rowKey]![i - 1];
    }
  }
  return newBoard;
}

Map<String, List<String>> shiftAliensLeft(board, row) {
  for (int i = 0; i < board[row].length; i++) {
    if (i == board[row].length - 2) {
      board[row][i] = Board.space;
      continue;
    } else if (board[row][i] == Board.border) {
      continue;
    } else {
      board[row][i] = board[row][i + 1];
    }
  }
  return board;
}
