import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

import 'board.dart';
import 'player.dart';
import 'user_input.dart';
enum KeyTypes {
  e([101]), // e
  d([100]), // d
  s([115]), // s
  f([102]), // f
  backspace([32]),
  unknown([]),
  right([67]),
  left([68]),
  up([65]),
  down([66]),
  ;

  final List<int> codes;
  const KeyTypes(this.codes);

  static dynamic fromValue(List<int> value) {
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