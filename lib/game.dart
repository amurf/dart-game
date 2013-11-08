import 'scene_manager.dart';
import 'player.dart';
import 'package:game_loop/game_loop_html.dart';

class Game extends GameLoopHtml {
  Map config;
  Player player;
  SceneManager sceneManager;

  Game(this.config, element) : super(element) {
    this.player       = new Player();
    this.sceneManager = new SceneManager(this);
  }

  startGameLoop() {
    onUpdate = sceneManager.currentScene.onUpdate;
    onRender = sceneManager.currentScene.onRender;
    start();
  }

  changeScene(String sceneName) {
    sceneManager.changeScene(sceneName);
    onUpdate = sceneManager.currentScene.onUpdate;
    onRender = sceneManager.currentScene.onRender;
  }

}
