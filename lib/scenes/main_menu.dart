part of scenes;

class MainMenu implements Scene {
  Menu menu;

  MainMenu(Game gameLoop) {
    menu = new Menu([
        new MenuItem("Start",   onClick: start, onMouseOver: startDown),
        new MenuItem("Options", onClick: (gameLoop) => print("OPTIONZ")),
        new MenuItem("Exit",    onClick: (gameLoop) => print("EXIT!")),
    ]);
    menu.onClickListener(gameLoop);
  }

  GameUpdateFunction onUpdate(Game gameLoop) { }

  GameRenderFunction onRender(Game gameLoop) {
    CanvasRenderingContext2D context = gameLoop.element.context2D;
    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    menu.draw(context);
  }

  Function start(Game gameLoop) {
    gameLoop.changeScene("TestingSceneTwo");
  }

  Function startDown(Game gameLoop) {
    menu.items[0].color = "red";
  }
}
