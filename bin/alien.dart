import "board.dart";

// function goes through the alien rows and shifts them right and then left across
// the screen. One iteration is considered shifting all the aliens so that the farthest
// to the right ends up in rightmost lastSpot before the border and then shifting
// the aliens all left until the leftmost alien occupies the leftmost spot next to
// the border.

Map<String, List<String>> aliensTraverseXaxis(int iterations, List rows) {
  var boardClass = Board();
  var mainBoard = boardClass.board;
  print('line 12 mainboard.values ${mainBoard.values}');

  List<String> row = rows[0];
    // the last coordinate before the right-hand border
  String lastSpot = row[row.length - 2];
  int count = 0;
  while (count < iterations) {
    if (lastSpot == Board.alien) {
      // once the aliens reach lastSpot, go left until they reach the firstSpot
      // while the aliens haven't yet reached the leftmost coordinate before the border
      while (row[1] != Board.alien) {
        
      // shift left if the first available coordinate isn't an alien
        for (var row in rows) {
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
      }
      // print the board
      for (var r in mainBoard.values) {
        print(r.join(' '));
      }
    }
    // if the first available coordinate is an alien, then the aliens have made one
    // full shift to the left. Add that to the count.
    if (row[1] == Board.alien) {
      count += 1;
    }
  }
  return mainBoard;
}

Map<String, List<String>> shiftAliensRight(
    Map<String, List<String>> newBoard1, List<String> row) {
  
  // TODO: refactor i value to not include border.
  // Todo: refactor i value into variable. Currently hard to read
  for (int i = row.length - 1; i >= 0; i--) {
    // when loop reaches leftmost coordinate,
    // it should be a space, not the border string
    if (i == 1) {
      row[i] = Board.space;
      continue;
    } else if (row[i] == Board.border) {
      continue;
    } else {
      row[i] = row[i - 1];
    }
  }
  return newBoard1;
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
