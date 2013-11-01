part of scenes;

class TestingScene implements Scene {

  TestingScene();

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) {
    gameLoop.y += gameLoop.dt * 2;
    if ( gameLoop.frame > 200 ) {
      gameLoop.changeScene("TestingTwo");
    }
  }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.getContext('2d');
    context.clearRect(0,0,200,100);
    context.font = "30px sans-serif";
    context.fillText("Scene 1", gameLoop.x, gameLoop.y, 100);
  }

}
