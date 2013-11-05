import 'scene.dart';
import 'scenes.dart';

class SceneManager {
  Map<String, Scene> scenes;
  Scene currentScene;
  String currentSceneName;

  // Some scenes will require player object
  SceneManager(player) {
    scenes = new Map();
    scenes["MainMenu"]         = new MainMenu();
    scenes["TestingSceneTwo"]  = new TestingSceneTwo(player);
    changeScene("MainMenu");
  }

  changeScene(sceneName) {
    currentSceneName = sceneName;
    currentScene     = scenes[sceneName];
  }
}
