class UserInput {
  List<int> processUserInput(List<int> event) {
    if (event.length >= 3 && event[1] == 91) {
      switch (event[2]) {
        // up arrow pressed
        case 65:
          event = [65];
          break;
        // down arrow pressed
        case 66:
          event = [66];
          break;
        // right arrow pressed
        case 67:
          event = [67];
          break;
        // left arrow pressed
        case 68:
          event = [68];
          break;
        default:
          print("Unknown escape sequence: $event");
      }
    }
    return event;
  }
}





    