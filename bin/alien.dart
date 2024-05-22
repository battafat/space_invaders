import "board.dart";

// function goes through the alien rows and shifts them right and then left across
// the screen.
Map<String, List<String>> aliensTraverseXaxis(int iterations, List rows) {
  var boardClass = Board();
  var mainBoard = boardClass.board;

  for (List<String> row in rows) {
    // the last coordinate before the right-hand border
    String lastSpot = row[row.length - 2];
    int count = 0;
    while (count < iterations) {
      if (lastSpot == Board.alien) {
        // while the aliens haven't yet reached the leftmost coordinate before the border
        while (row[1] != Board.alien) {
        // shift left if the first available coordinate isn't an alien
          for (var row in rows) {
            shiftAliensLeft(mainBoard, row);
            shiftAliensLeft(mainBoard, row);
          }
        // print the board
          for (var r in mainBoard.values) {
            print(r.join(' '));
          }
        }
      } else {
        //shift right if the aliens are as far left as possible
        for (var row in rows) {
          shiftAliensRight(mainBoard, row);
          shiftAliensRight(mainBoard, row);
        }
        // print the board
        for (var r in mainBoard.values) {
          print(r.join(' '));
        }
      }
      for (var row in rows) {
      // if the first available coordinate is an alien, then the aliens have made one
      // full shift to the left. Add that to the count.
        if (mainBoard[row]?[1] == Board.alien) {
          count += 1;
        }
      }
    }
  }
  return mainBoard;
}

Map<String, List<String>> shiftAliensRight(
    Map<String, List<String>> newBoard1, List<String> row) {
  var newBoard = newBoard1;
  // TODO: refactor i value to not include border.
  // Todo: refactor i value into variable. Currently hard to read
  for (int i = row.length - 1; i >= 0; i--) {
    if (i == 1) {
      row[i] = Board.space;
      continue;
    } else if (row[i] == Board.border) {
      continue;
    } else {
      row[i] = row[i - 1];
    }
  }
  return newBoard;
}

Map<String, List<String>> shiftAliensLeft(
    Map<String, List<String>> board, List<String> row) {
  for (int i = 0; i < row.length; i++) {
    if (i == row.length - 2) {
      row[i] = Board.space;
      continue;
    } else if (row[i] == Board.border) {
      continue;
    } else {
      row[i] = row[i + 1];
    }
  }
  return board;
}
