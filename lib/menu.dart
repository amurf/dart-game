import 'menu_item.dart';
import 'dart:math';

class Menu {
  List<MenuItem> items;
  num itemPadding = 40;
  num fontSize    = 20;
  num width       = 500;

  Menu(this.items, {this.itemPadding, this.fontSize, this.width});

  void onClickListener(GameLoop gameLoop) {
      gameLoop.element.onClick.listen((e) {
        var rect        = gameLoop.element.getBoundingClientRect();
        var clickedPoint = new Point(e.clientX - rect.left, e.clientY - rect.top);
        this.clickCheck(clickedPoint, gameLoop);
      });
  }


  void draw(CanvasRenderingContext context) {
    context.font = fontSize.toString()+"pt sans-serif";
    for (num x = 0; x < items.length; x++) {
      context.save();
      context.fillStyle = items[x].color;
      context.fillText(items[x].label, width, itemPadding * (x+1) + fontSize);
      context.restore();
    }

  }

  void clickCheck(Point clickedPoint, GameLoop gameLoop) {
    for (num x = 0; x < items.length; x++) {
      var stringWidth = stringWidth(items[x].label, gameLoop);
      var stringRect  = new Rectangle(this.width, itemPadding * (x+1), stringWidth, fontSize);
      if (detectCollision(stringRect, clickedPoint)) {
        items[x].onClick(gameLoop);
      }
    }
  }

  num stringWidth(String str, GameLoop gameLoop) => gameLoop.element.context2D.measureText(str).width;

  bool detectCollision(Rectangle rect, Point mouseClick) =>
    ( mouseClick.x > rect.left && mouseClick.x < rect.right && mouseClick.y >= rect.top && mouseClick.y <= rect.bottom );


}



