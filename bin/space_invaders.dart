import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'alien.dart';
import 'board.dart';
import 'key_types.dart';
import 'player.dart';
import 'user_input.dart';

late final StreamSubscription<List<int>> stdinStreamSubscription;

void main() async {
  // TODO: add reset command at beginning to make sure terminal is clear
  var controlBoard = Board();
  final alien = Alien();
  final player = Player();
  stdout.flush();
  
  Map<String, List<String>> board = controlBoard.board;
  var playerRow = board[Board.playerRow];
  List<List<String>> alienRows = [
    board[Board.alienRow1]!,
    board[Board.alienRow2]!
  ];
  // attempted (incomplete) solution to
  // input user keystrokes without pressing enter:
  // stdin.lineMode = false;
  List<int> buffer = []; // Buffer to accumulate key press bytes
  // StreamController<Map<String, List<String>>> streamController = StreamController<Map<String, List<String>>>();
  
  StreamController<List<int>> streamController = StreamController<List<int>>.broadcast();
  //TODO: look up in dart_complete_reference how to use the stream controller
  stdinStreamSubscription = stdin.listen((event) {
    // print('event ${event.toString()}');
    final key = KeyTypes.fromValue(event);
    handleKeyEvent(key, playerRow!, player);
    // print('key = $key');
    // print(playerRow.join(' '));
    streamController.add(event); // Send the update signal
  });
  
  alien.aliensTraverseXaxis(board, 2, alienRows, streamController);
  // stdinStreamSubscription.cancel();

  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  stdout.flush();
}
