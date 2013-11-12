import 'game.dart';
import 'menu_item.dart';
import 'dart:math';
import 'dart:html';

class Menu {
  List<MenuItem> items;
  num itemPadding;
  num fontSize;
  num width;

  Menu(this.items, {this.itemPadding: 40, this.fontSize: 20, this.width: 500});

  void onClickListener(Game gameLoop) {
      gameLoop.element.onClick.listen((e) {
        var rect         = gameLoop.element.getBoundingClientRect();
        var clickedPoint = new Point(e.clientX - rect.left, e.clientY - rect.top);
        clickCheck(clickedPoint, gameLoop);
      });
  }


  void draw(CanvasRenderingContext2D context) {
    context.font = fontSize.toString()+"pt sans-serif";
    for (num x = 0; x < items.length; x++) {
      context.save();
      context.fillStyle = items[x].color;
      context.fillText(items[x].label, width, itemPadding * (x+1) + fontSize);
      context.restore();
    }

  }

  void clickCheck(Point clickedPoint, Game gameLoop) {
    for (num x = 0; x < items.length; x++) {
      var strWidth = stringWidth(items[x].label, gameLoop);
      var stringRect  = new Rectangle(width, itemPadding * (x+1), strWidth, fontSize);
      if (detectCollision(stringRect, clickedPoint)) {
        items[x].onClick(gameLoop);
      }
    }
  }

  num stringWidth(String str, Game gameLoop) => gameLoop.element.context2D.measureText(str).width;

  bool detectCollision(Rectangle rect, Point mouseClick) =>
    ( mouseClick.x > rect.left && mouseClick.x < rect.right && mouseClick.y >= rect.top && mouseClick.y <= rect.bottom );


}



