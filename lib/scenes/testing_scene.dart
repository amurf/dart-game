part of scenes;

class TestingScene implements Scene {

  ImageElement img = new ImageElement();

  TestingScene();

  GameLoopUpdateFunction onUpdate(GameLoop gameLoop) {
    img.width  = 100;
    img.height = 100;
    img.src    = "spritesheet.png";
    if ( gameLoop.keyboard.isDown(Keyboard.RIGHT) && gameLoop.gameTime >= gameLoop.last_key_press + 0.200) {
      if (gameLoop.scale_x == -1 ) {
        gameLoop.scale_x = -1;
        gameLoop.x *= 0;
      }
      gameLoop.sprite_x += 64;
      gameLoop.x += 10;
      gameLoop.scale_x = 1;
      gameLoop.last_key_press = gameLoop.gameTime;
    } else if ( gameLoop.keyboard.isDown(Keyboard.LEFT) && gameLoop.gameTime >= gameLoop.last_key_press_2 + 0.200) {
      if (gameLoop.scale_x == 1 ) {
        gameLoop.scale_x = -1;
        gameLoop.x *= -1;
      }
      gameLoop.sprite_x += 64;
      gameLoop.x += 10;
      gameLoop.last_key_press_2 = gameLoop.gameTime;
    }

    if ( gameLoop.frame > 20000 ) {
      gameLoop.changeScene("TestingTwo");
    }
  }

  GameLoopRenderFunction onRender(GameLoop gameLoop) {
    CanvasRenderingContext context = gameLoop.element.context2D;
    if (gameLoop.sprite_x == 64*4) {
      gameLoop.sprite_x = 0;
    }
    context.fillStyle = "rgb(200,0,0)";
    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    context.font = "30px sans-serif";
    //context.fillText("Scene 1", gameLoop.x, gameLoop.last_key_press, 100);
    // Take the middle 20x20 pixels from the img and stretch them.
    context.save();
    context.scale(gameLoop.scale_x , 1);
    context.drawImageScaledFromSource(img, gameLoop.sprite_x, 0, 64, 64, gameLoop.x, 100, 50, 50);
    context.restore();

  }

}
