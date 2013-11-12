import 'game.dart';
import 'player.dart';

class KeyHandler {
  num keyCode;
  num lastPressed = 0;
  num keyDelay    = 0;
  Function keyFunction;

  KeyHandler(this.keyCode, this.keyDelay, this.keyFunction);

  void doKeyFunction(Game gameLoop, Player player) {
    if (isReady(gameLoop))
      keyFunction(gameLoop, player);
      lastPressed = gameLoop.gameTime;
  }

  bool isReady(Game gameLoop) => gameLoop.gameTime > keyDelay + lastPressed;

}
