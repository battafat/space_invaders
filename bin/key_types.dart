import 'dart:async';
import 'package:collection/collection.dart';
enum KeyTypes {
  e([101]), // e
  d([100]), // d
  s([115]), // s
  f([102]), // f
  backspace([32]),
  unknown([]),
  right([67]), // right arrow key
  left([68]), // left arrow key
  up([65]), // up arrow key
  down([66]), // down arrow key
  ;

  final List<int> codes;
  const KeyTypes(this.codes);
// fromValue matches the processed user input with a KeyType
  static dynamic fromValue(List<int> value) {
    final eq = ListEquality();
    // values is automatically declared by Dart, which is a list of enums
    return values.firstWhere(
      (e) => eq.equals(e.codes, value),
      orElse: () => unknown,
    );
  }
}  