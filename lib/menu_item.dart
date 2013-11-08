class MenuItem {
  String label;
  String color = "black";
  Function onClick;
  Function onMouseOver;

  MenuItem(this.label, {this.onClick, this.onMouseOver});
}
