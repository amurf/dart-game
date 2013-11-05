import 'sprite.dart';
import 'keymap.dart';

class Player { 
    final num baseMovementSpeed = 5;
    
    num x = 0;
    num y = 0;
    Sprite sprite;
    KeyMap keyMap;

    Player() { 
      this.sprite = new Sprite("spritesheet.png", 
                                         width: 64, 
                                        height: 64, 
                                   totalFrames: 3,
                                animationSpeed: 0.1);
      this.keyMap = new KeyMap(this);
    }
   
    void checkKeyStatus(GameLoop gameLoop) {
      keyMap.checkKeyStatus(gameLoop);
    }


    num moveX(GameLoop gameLoop) {
      this.x += baseMovementSpeed + (baseMovementSpeed*sprite.animationSpeed);
      this.animate(gameLoop);
    }
    
    num moonwalk(GameLoop gameLoop) {
      this.x -= baseMovementSpeed + (baseMovementSpeed*sprite.animationSpeed);
      this.animate(gameLoop);
    }

    // Chain methods to sprite class
    void readyToAnimate(currentTime) => sprite.readyToAnimate(currentTime);
    void draw(context)               => sprite.draw(context, x, y);
    void animate(GameLoop gameLoop) {
      num currentTime = gameLoop.gameTime;
      if (sprite.readyToAnimate(currentTime)) {
        sprite.animate(currentTime);
      }
    }

}
