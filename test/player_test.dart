import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/player.dart';
import '../bin/vertex_types.dart';

void main () {
  group('moveRight tests', (){
    test('moveRight, player at row[1]', (){
      final player = Player();
      final rowIn = ['|', '^', ' ', ' ', ' ', ' ', ' ', ' ', '|'];
      final rowOut = ['|', ' ', '^', ' ', ' ', ' ', ' ', ' ', '|'];
      final actual = player.moveRight(rowIn);
      expect(actual, rowOut);
    });
  });
}