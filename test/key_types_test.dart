import 'package:test/test.dart';

import '../bin/key_types.dart';

main (){
   group('KeyTypes tests', (){
    test('KeyTypes.fromValue(), right arrow test', () {
    // arrange
    final value = [67];
    // act
    final actual = KeyTypes.fromValue(value);
    // assert
      expect(actual, KeyTypes.right);
    });
    test('KeyTypes.fromValue(),left arrow test', () {
      // arrange
      final value = [68];
      // act
      final actual = KeyTypes.fromValue(value);
      // assert
      expect(actual, KeyTypes.left);
    });
    test('KeyTypes.fromValue(), backspace test', () {
      // arrange
      final value = [32];
      // act
      final actual = KeyTypes.fromValue(value);
      // assert
      expect(actual, KeyTypes.backspace);
    });
    test('KeyTypes.fromValue(), backspace test', () {
      // arrange
      final value = [32];
      // act
      final actual = KeyTypes.fromValue(value);
      // assert
      expect(actual, KeyTypes.backspace);
    });
  });
}