part of scenes;

class TestingSceneTwo implements Scene {
  Player player;

  TestingSceneTwo(this.player); // this scene requires a player obj

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) {
    player.checkKeyStatus(gameLoop);
    // How to swap scenes on the fly
    //if ( gameLoop.frame % 471 == 0 ) {
    //  gameLoop.changeScene("TestingTwo");
    //}
  }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.context2D;
    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    context.font = "30px sans-serif";

    context.fillText("Scene 1", 0, 100, 100);
    player.draw(context);
  }

}
