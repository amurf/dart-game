import 'dart:html';
import 'lib/game.dart';
import 'package:dart_config/default_browser.dart';

main() {
  loadConfig().then((Map config) {
    CanvasElement canvas = new CanvasElement(width: config['width'], height: config['height']);
    document.body.nodes.add(canvas);
    new Game(config, canvas).startGameLoop();
  });
}
