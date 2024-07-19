import 'package:test/test.dart';

import '../bin/user_input.dart';

void main (){
  group('processUserInput tests', (){
    test('processUserInput,right arrow test', () {
      // arrange
      final userInput = UserInput();
      final event = [27, 91, 67];
      final matcher = [67];
      // act
      final actual = userInput.processUserInput(event);
      // assert
      expect(actual, matcher);
    });
    test('processUserInput,left arrow test', () {
      // arrange
      final userInput = UserInput();
      final event = [27, 91, 68];
      final matcher = [68];
      // act
      final actual = userInput.processUserInput(event);
      // assert
      expect(actual, matcher);
    });
    test('processUserInput,up arrow test', () {
      // arrange
      final userInput = UserInput();
      final event = [27, 91, 65];
      final matcher = [65];
      // act
      final actual = userInput.processUserInput(event);
      // assert
      expect(actual, matcher);
    });
    test('processUserInput, down arrow test', () {
      // arrange
      final userInput = UserInput();
      final event = [27, 91, 66];
      final matcher = [66];
      // act
      final actual = userInput.processUserInput(event);
      // assert
      expect(actual, matcher);
    });
    test('processUserInput, non-escape code event test', () {
      // arrange
      final userInput = UserInput();
      final event = [22, 91, 68, 44];
      // act
      final actual = userInput.processUserInput(event);
      // assert
      expect(actual, event);
    });
    test('processUserInput, default event test', () {
      // arrange
      final userInput = UserInput();
      final event = [27, 91, 44];
      // act
      final actual = userInput.processUserInput(event);
      print('actual: $actual');
      print('event $event');
      // assert
      expect(actual, event);
    });
    
  });  
}