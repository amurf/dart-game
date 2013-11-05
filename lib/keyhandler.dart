class KeyHandler {
  num keyCode;
  num lastPressed = 0;
  num keyDelay    = 0;
  Function keyFunction;

  KeyHandler(this.keyCode, this.keyDelay, this.keyFunction);

  void doKeyFunction(GameLoop gameLoop, Player player) {
    if (this.isReady(gameLoop))
      this.keyFunction(gameLoop, player);
      this.lastPressed = gameLoop.gameTime;
  }

  bool isReady(GameLoop gameLoop) => gameLoop.gameTime > keyDelay + lastPressed;

}
