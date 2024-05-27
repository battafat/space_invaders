class Board {
  static const space = ' ';
  static const alien = '@';
  static const border = '|';

  static const alienRow1 = "alienRow1";
  static const alienRow2 = "alienRow2";
  static const blankRow1 = "blankRow1";
  static const blankRow2 = "blankRow2";
  static const blankRow3 = "blankRow3";
  static const blankRow4 = "blankRow4";
  static const blankRow5 = "blankRow5";
  static const playerRow = "playerRow";

  Map<String, List<String>> board = {
    "alienRow1": ['|', ' ', ' ', '@', '@', '@', ' ', ' ', '|'],
    "alienRow2": ['|', ' ', ' ', '@', '@', '@', ' ', ' ', '|'],
    "blankRow1": ['|', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '|'],
    "blankRow2": ['|', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '|'],
    "blankRow3": ['|', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '|'],
    "blankRow4": ['|', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '|'],
    "blankRow5": ['|', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '|'],
    "playerRow": ['|', ' ', ' ', ' ', '^', ' ', ' ', ' ', '|'],
  };
  // should these be nullable?
  List<String>? getRow(String rowKey){
    List<String>? row = board[rowKey];
    return row;
  }


  void displayBoard(board) {
    for (var r in board.values) {
      print(r.join(' '));
    }
  }
}




  int rows = 8;
  int cols = 7;
  void makeBoard(rows, cols) {
    List board = [];
    List currentRow = [];
    double half = (cols - 1) / 2;
    int middle = half.ceil();
    dynamic coordinate;
    List margin = [];
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (j == 0 || j == (cols - 1)) {
          coordinate = "|";
        } else if (i <= 1) {
          coordinate = "@";
        } else if (i == (rows - 1) && j == middle) {
          coordinate = "^";
        } else {
          // coordinate = (i, j);
          coordinate = " ";
        }
        // print(coordinate);

        currentRow.add(coordinate);
      }
      // TODO: separate makeBoard into make and print
      board.add(currentRow);
      // print(currentRow.join(' '));

      currentRow = [];
    }

    // for (List i in board){
    //   print(i.join(' '));
    // }
  }

