import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dart_console/dart_console.dart';
import 'alien.dart';
import 'board.dart';
import 'key_types.dart';
import 'player.dart';
import 'user_input.dart';

late final StreamSubscription<List<int>> stdinStreamSubscription;
const rows = 10;
const columns = 15;
const right = 1;
const left = -1;
var direction = right;
var playerPosition = Point(rows - 1, (columns ~/ 2));
void main() async {
  // TODO: add reset command at beginning to make sure terminal is clear
  var changeDirection = false;
  final player = Player();
  var alienPositions = [Point(0,1), Point(0,2), Point(0,3)];
  
  stdout.flush();
   
  stdin.lineMode = false;
  // StreamController<Map<String, List<String>>> streamController = StreamController<Map<String, List<String>>>();
  stdin.echoMode = false;
  StreamController<List<int>> streamController = StreamController<List<int>>.broadcast();
  // StreamSubscription<List<int>> subscriber1;
  StreamSubscription<List<int>> subscriber1;
  
    stdinStreamSubscription = stdin.listen((event) {
      // TODO: add if statment for escape code: 27(?)
      if (event.length >= 3 && event[1] == 91) { 
            switch (event[2]) {
              // up arrow pressed
              case 65:
                event = [65];
                break;
              // down arrow pressed
              case 66:
                event = [66];
                break;
                // right arrow pressed
              case 67:
                event = [67];
                break;
                // left arrow pressed
              case 68:
                event = [68];
                break;
              default:
                print("Unknown escape sequence: $event");
            }
        print('57 $event');
      }
      // streamController.add(event); // Send the update signal
      // print('event $event');
      final KeyTypes key = KeyTypes.fromValue(event);
      player.handlePlayerMove(key, playerPosition);
      print('64 $key');
      streamController.add(event);
    });
  // Timer.periodic(Duration(seconds: 3), (Timer timer) async {
  while (true){
    subscriber1 = streamController.stream.listen((event) {
      final KeyTypes key = KeyTypes.fromValue(event);
      playerPosition = player.handlePlayerMove(key, playerPosition);
      print('71 key: $key');
     });
    await Future.delayed(Duration(milliseconds: 100));
    for (var row = 0; row < rows; row++){
      for (var column = 0; column < columns; column++){
        if (alienPositions.contains(Point(row,column))){
          stdout.write(Board.alien);
          if (column == columns - 1){
            changeDirection = true; 
          }
        }
        else if (playerPosition == Point(row, column)){
          stdout.write(Board.player);
        }
        else {
          // stdout.write(Board.space);
          stdout.write('_');
        }
      }
        stdout.writeln();
    }
    Future.delayed(Duration(seconds: 1));
    if (changeDirection == true){
      if (direction == right){
        direction = left;
      }
      if (direction == left){
        direction = right;
      }
    }
    // subscriber1 = streamController.stream.listen((event) {
    //   print('68 $event');
    //   final key = KeyTypes.fromValue(event);
    //   print('70 $key');
    //   playerPosition = player.handlePlayerMove(key, playerPosition);

    //   // streamController.add(event);
    // });
    
    subscriber1.cancel();

    // subscriber1.cancel();
  } 
  // });
  

  
 
  // makes sure the buffer is flushed so that terminal
  // doesn't print previous game's output
  stdout.flush();
}
