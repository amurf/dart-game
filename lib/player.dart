import 'game.dart';
import 'sprite.dart';
import 'keymap.dart';

class Player {
    num momentum = 5;

    num x = 0;
    num y = 20;
    Sprite sprite;
    KeyMap keyMap;

    Player() {
      sprite = new Sprite("images/spritesheet.png",
                                         width: 64,
                                        height: 64,
                                   totalFrames: 3,
                                animationSpeed: 0.1);
      keyMap = new KeyMap(this);
    }

    void checkKeyStatus(Game gameLoop) {
      keyMap.checkKeyStatus(gameLoop);
    }


    num moveX(Game gameLoop) {
      x += momentum + (momentum*sprite.animationSpeed);
      animate(gameLoop);
    }

    num moonwalk(Game gameLoop) {
      x -= momentum + (momentum*sprite.animationSpeed);
      if ( momentum != 5 ) {
        momentum = 5;
      }
      animate(gameLoop);
    }

    // Chain methods to sprite class
    bool readyToAnimate(currentTime) => sprite.readyToAnimate(currentTime);
    void draw(context)               => sprite.draw(context, x, y);
    void animate(Game gameLoop) {
      num currentTime = gameLoop.gameTime;
      if (sprite.readyToAnimate(currentTime)) {
        sprite.animate(currentTime);
      }
    }

}
