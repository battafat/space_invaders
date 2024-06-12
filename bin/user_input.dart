import 'key_types.dart';
import 'player.dart';





List<String> handleKeyEvent(KeyTypes key, List<String> playerRow, Player player ){
  // final player = Player();
  if (key == KeyTypes.right){
    return player.checkMove(playerRow, key);
  // print(playerRow);
  }
  if (key == KeyTypes.left){
    return player.checkMove(playerRow, key);
    // print(playerRow);
  }
  else{
    print('Neither left nor right entered');
  }
  return playerRow;
}
    