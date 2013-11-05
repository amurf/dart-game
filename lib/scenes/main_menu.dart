part of scenes;

class MainMenu implements Scene {
  Menu menu;

  MainMenu() {
    this.menu = new Menu(["Start", "Options", "Exit"], 50);
  }

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) {
    var clientRect = gameLoop.element.getBoundingClientRect();
    gameLoop.element.onClick.listen((e) {
      gameLoop.changeScene("TestingSceneTwo");
    });
  }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.context2D;

    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    menu.draw(context);
  }

}
