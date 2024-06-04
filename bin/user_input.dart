import 'key_types.dart';
import 'player.dart';





List<String> handleKeyEvent(KeyTypes key, List<String> playerRow ){
  final player = Player();
  if (key == KeyTypes.right){
    return player.checkMove(playerRow, key);
  // print(playerRow);
  }
  if (key == KeyTypes.left){
    return player.checkMove(playerRow, key);
    // print(playerRow);
  }
  else{
    print('only left and right arrows allowed');
  }
  return playerRow;
}
    