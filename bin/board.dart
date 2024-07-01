class Board {
  static const space = ' ';
  static const alien = '@';
  static const border = '|';
  static const player = '^';
  static const rows = 10;
  static const columns = 15;
  static const right = 1;
  static const left = -1;
  
  void clearScreen() {
      print('\x1B[2J\x1B[H');
  }

  int validateDirection(int direction) {
    if (direction == right) {
      direction = left;
    } else {
      direction = right;
    }
    return direction;
  }

}




  
  

