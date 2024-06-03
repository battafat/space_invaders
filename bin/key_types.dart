import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';

import 'user_input.dart';
enum KeyTypes {
  up([27, 91, 65, 10]),
  down([27, 91, 66, 10]),
  left([27, 91, 68, 10]),
  right([27, 91, 67, 10]),
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
  late StreamController<List<int>> _controller;
  KeystrokeStream(){
    _controller = StreamController<List<int>>(
        onListen: _startStream,
        onResume: _startStream,
        onPause: _stopTimer,
        onCancel: _stopTimer);
  }
   
  void _startStream(playerRow){
    stdin.listen((keyValues) {
    final key = KeyTypes.fromValue(keyValues);
    final updatedPlayerRow = handleKeyEvent(key, playerRow!);
    print(updatedPlayerRow);
    });
  }
}