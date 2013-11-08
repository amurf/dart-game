import 'scene.dart';
import 'scenes.dart';

class SceneManager {
  Map<String, Scene> scenes;
  Scene currentScene;
  String currentSceneName;

  // Some scenes will require player object
  SceneManager(GameLoop gameLoop) {
    scenes = new Map();
    scenes["MainMenu"]         = new MainMenu(gameLoop);
    scenes["TestingSceneTwo"]  = new TestingSceneTwo(gameLoop.player);
    changeScene("MainMenu");
  }

  changeScene(sceneName) {
    currentSceneName = sceneName;
    currentScene     = scenes[sceneName];
  }
}
