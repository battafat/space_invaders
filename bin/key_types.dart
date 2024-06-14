import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

import 'board.dart';
import 'player.dart';
import 'user_input.dart';
enum KeyTypes {
  up([101, 10]), // e
  down([100, 10]), // d
  left([115, 10]), // s
  right([102, 10]), // f
  backspace([32, 10]),
  unknown([]),
  ;

  final List<int> codes;
  const KeyTypes(this.codes);

  static KeyTypes fromValue(List<int> value) {
    final eq = ListEquality();
    return values.firstWhere(
      (e) => eq.equals(e.codes, value),
      orElse: () => unknown,
    );
  }
}  

class KeystrokeStream {
  late StreamController<Map<String, List<String>>> _controller;
  KeystrokeStream(){
    _controller = StreamController<Map<String, List<String>>>(
        onListen: _startStream,
        onResume: _startStream,
        onPause: _pauseStdin,
        // onCancel: _stopTimer
        );
  }
   
  void _startStream(){
    final board = Board().board;
    final playerRow = board[Board.playerRow];
    // stdin.listen((keyValues) {

    // });
  }

  void _pauseStdin(){
    
  }

  Stream<Map<String, List<String>>> get stream => _controller.stream;
}