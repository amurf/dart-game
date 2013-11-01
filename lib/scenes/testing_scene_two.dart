part of scenes;

class TestingSceneTwo implements Scene {

  TestingSceneTwo();

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) {
    gameLoop.y -= gameLoop.dt * 2;
  }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.getContext('2d');
    context.clearRect(0,0,200,100);
    context.font = "30px sans-serif";
    context.fillText("Scene 2",gameLoop.x, gameLoop.y, 100);
  }

}
