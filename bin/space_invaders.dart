import 'dart:async';
import 'alien.dart';
import 'board.dart';
import 'game_loop.dart';
import 'player.dart';
import 'user_input.dart';


late final StreamSubscription<List<int>> stdinStreamSubscription;
void main() async {
  final gameLoop = GameLoop();
  final player = Player();
  final controlBoard = Board();
  final alien = Alien();
  final userInput = UserInput();
  
  userInput.startUserInput(player);
  gameLoop.runGameLoop(controlBoard, alien, player);
}
