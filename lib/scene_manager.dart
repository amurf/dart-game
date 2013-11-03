import 'scene.dart';
import 'scenes.dart';

class SceneManager {
  Map<String, Scene> scenes;
  Scene currentScene;
  String currentSceneName;

  // Some scenes will require player object
  SceneManager(player) {
    scenes = new Map();
    scenes["Testing"]    = new TestingScene(player);
    scenes["TestingTwo"] = new TestingSceneTwo(player);
    changeScene("Testing");
  }

  changeScene(sceneName) {
    currentSceneName = sceneName;
    currentScene     = scenes[sceneName];
  }
}
