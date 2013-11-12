import 'player.dart';
import 'keyhandler.dart';
import 'package:game_loop/game_loop_html.dart';

class KeyMap {
  Map<num, KeyHandler> keyMap;
  Player player;

  KeyMap(this.player) {
    keyMap = new Map();

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

    addKey(Keyboard.I, 0, (gameLoop, player) {
        gameLoop.sceneManager.currentScene.blocks[0].image.src = "images/ice.png";
        gameLoop.sceneManager.currentScene.blocks[0].momentum = 0;
        gameLoop.sceneManager.currentScene.blocks[1].image.src = "images/ice.png";
        gameLoop.sceneManager.currentScene.blocks[1].momentum = 0;
        gameLoop.sceneManager.currentScene.blocks[2].image.src = "images/ice.png";
        gameLoop.sceneManager.currentScene.blocks[2].momentum = 0;
    });

    addKey(Keyboard.W, 0, (gameLoop, player) {
        gameLoop.sceneManager.currentScene.blocks[0].image.src = "images/water.png";
        gameLoop.sceneManager.currentScene.blocks[0].momentum = 0.5;
        gameLoop.sceneManager.currentScene.blocks[1].image.src = "images/water.png";
        gameLoop.sceneManager.currentScene.blocks[1].momentum = 0.5;
        gameLoop.sceneManager.currentScene.blocks[2].image.src = "images/water.png";
        gameLoop.sceneManager.currentScene.blocks[2].momentum = 0.5;
    });
  }
  void addKey(num keyCode, num keyDelay, Function keyFunction) {
    keyMap[keyCode] = new KeyHandler(keyCode, keyDelay, keyFunction);
  }

  void checkKeyStatus(GameLoopHtml gameLoop) {
    keyMap.forEach((key, val) {
      if (isKeyDown(key, gameLoop)) {
        val.doKeyFunction(gameLoop, player);
      }
    });
  }

  bool isKeyDown(num key, GameLoopHtml gameLoop) => gameLoop.keyboard.isDown(key);


}
