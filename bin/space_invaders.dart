import 'dart:async';
import 'dart:io';
import 'alien.dart';
import 'board.dart';
import 'game_loop.dart';
import 'player.dart';
import 'user_input.dart';

late final StreamSubscription<List<int>> stdinStreamSubscription;

void main() async {
  // TODO: add reset command at beginning to make sure terminal is clear
  final gameLoop = GameLoop();
  final player = Player();
  final controlBoard = Board();
  final alien = Alien();
  final userInput = UserInput();

  stdout.flush();
  userInput.startUserInput(player);
  gameLoop.runGameLoop(controlBoard, alien, player);
  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  //TODO: add some kind of reset? that or endGame function
  stdout.flush();
}
