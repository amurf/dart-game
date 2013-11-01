import 'scene.dart';
import 'scenes.dart';

class SceneManager {
  Map<String, Scene> scenes;
  Scene currentScene;
  String currentSceneName;

  SceneManager() {
    scenes = new Map();
    scenes["Testing"]    = new TestingScene();
    scenes["TestingTwo"] = new TestingSceneTwo();
    changeScene("Testing");
  }

  changeScene(sceneName) {
    currentSceneName = sceneName;
    currentScene     = scenes[sceneName];
  }
}
