import 'game.dart';
import 'dart:html';

class Block {

  num x;
  num y;
  num width;
  num height;
  num momentum;
  bool collidable = true;
  ImageElement image;

  Block({this.x, this.y, this.width, this.height, this.momentum: 0.5}) {
    image = new ImageElement(src: "images/water.png", width: width, height: height);
  }

  void draw(context) {
    var pattern = context.createPatternFromImage(image, "repeat");
    context.fillStyle = pattern;
    context.fillRect(x, y, width, height);
  }
}
