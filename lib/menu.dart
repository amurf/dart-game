class Menu {
  List items;
  num padding;
  
  Menu(this.items, this.padding);
  

  void draw(CanvasRenderingContext context) {
    context.font = "30px sans-serif";
    for (num x = 0; x < items.length; x++) {
      context.fillText(items[x], 500, padding*(x+1), 100);
    }
  }

  void checkClick(num x, num y) {
    print(x);
  }

}
