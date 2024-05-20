class Board {
  static const space = ' ';
  static const alien = '@';
  static const border = '|';

  final alienRow1 = "alienRow1";
  final alienRow2 = "alienRow2";
  final blankRow1 = "blankRow1";
  final blankRow2 = "blankRow2";
  final blankRow3 = "blankRow3";
  final blankRow4 = "blankRow4";
  final blankRow5 = "blankRow5";
  final playerRow = "playerRow";

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
    print('line 120 ${board["alienRow"]}');
    // print(board.values.join(' '));
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

