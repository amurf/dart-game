import 'scene_manager.dart';
import 'package:game_loop/game_loop_html.dart';

class Game extends GameLoopHtml {
  Map config;
  num x = 150;
  num sprite_x = 0;
  num scale_x  = 1;
  num last_key_press = 0;
  num last_key_press_2 = 0;
  SceneManager sceneManager;

  Game(this.config, element) : super(element) {
    sceneManager = new SceneManager();
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
