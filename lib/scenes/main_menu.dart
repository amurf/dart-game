part of scenes;

class MainMenu implements Scene {
  Menu menu;

  MainMenu(GameLoop gameLoop) {
    this.menu = new Menu([
        new MenuItem("Start",   onClick: start, onMouseOver: startDown),
        new MenuItem("Options", onClick: (gameLoop) => print("OPTIONZ")),
        new MenuItem("Exit",    onClick: (gameLoop) => print("EXIT!")),
    ]);
    this.menu.onClickListener(gameLoop);
  }

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) { }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.context2D;
    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    menu.draw(context);
  }

  Function start(GameLoop gameLoop) {
    gameLoop.changeScene("TestingSceneTwo");
  }

  Function startDown(GameLoop gameLoop) {
    this.menu.items[0].color = "red";
  }
}
