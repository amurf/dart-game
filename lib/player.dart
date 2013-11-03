import 'sprite.dart';

class Player { 
    num x = 0;
    num y = 0;
    Sprite sprite;

    final num baseMovementSpeed = 10;

    Player() { 
      this.sprite = new Sprite("spritesheet.png", 
                                         width: 64, 
                                        height: 64, 
                                   totalFrames: 3,
                                animationSpeed: 0.1);
    }

    num moveX() => this.x += baseMovementSpeed + (baseMovementSpeed*sprite.animationSpeed);
}
