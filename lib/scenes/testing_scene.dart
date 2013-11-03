part of scenes;

class TestingScene implements Scene {
  Player player;

  TestingScene(this.player); // this scene requires a player

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) {
    if ( gameLoop.keyboard.isDown(Keyboard.RIGHT) && player.sprite.readyToAnimate(gameLoop.gameTime)) {
        player.moveX();
        player.sprite.animate(gameLoop.gameTime);
    }
    // How to swap scenes on the fly
    if ( gameLoop.frame > 20000 ) {
      gameLoop.changeScene("TestingTwo");
    }
  }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.context2D;
    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    context.font = "30px sans-serif";

    context.fillText("Scene 1", 0, 100, 100);
    player.draw(context);
  }

}
