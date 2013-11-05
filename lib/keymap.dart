import 'player.dart';
import 'keyhandler.dart';
import 'package:game_loop/game_loop_html.dart';

class KeyMap {
  Map<num, KeyHandler> keyMap;
  Player player;

  KeyMap(this.player) {
    this.keyMap = new Map();
   
    // Adding functions to keycodes :)
    // (code, delay, function)
    addKey(Keyboard.RIGHT, 0, (gameLoop, player) {
        player.moveX(gameLoop);
    });
    
    addKey(Keyboard.LEFT, 0, (gameLoop, player) {
        player.moonwalk(gameLoop);
    });
    
    addKey(Keyboard.M, 0, (gameLoop, player) {
        gameLoop.changeScene("MainMenu");
    });
  }
  void addKey(num keyCode, num keyDelay, Function keyFunction) {
    this.keyMap[keyCode] = new KeyHandler(keyCode, keyDelay, keyFunction);
  }
  
  void checkKeyStatus(GameLoop gameLoop) {
    this.keyMap.forEach((key, val) {
      if (isKeyDown(key, gameLoop)) {
        val.doKeyFunction(gameLoop, player);
      }
    });
  }

  bool isKeyDown(num key, GameLoop gameLoop) => gameLoop.keyboard.isDown(key);


}
