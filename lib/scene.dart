import 'game.dart';

typedef void GameUpdateFunction(Game gameLoop);
typedef void GameRenderFunction(Game gameLoop);
typedef void GameResizeFunction(Game gameLoop);
typedef void GameFullscreenChangeFunction(Game gameLoop);
typedef void GamePointerLockChangeFunction(Game gameLoop);


class Scene {
  GameUpdateFunction onUpdate;
  GameRenderFunction onRender;
  GameResizeFunction onResize;
  GameFullscreenChangeFunction onFullscreenChange;
  GamePointerLockChangeFunction onPointerLockChange;
}

