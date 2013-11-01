import 'package:game_loop/game_loop_html.dart';

typedef void GameLoopUpdateFunction(GameLoop gameLoop);
typedef void GameLoopRenderFunction(GameLoop gameLoop);
typedef void GameLoopResizeFunction(GameLoop gameLoop);
typedef void GameLoopFullscreenChangeFunction(GameLoop gameLoop);
typedef void GameLoopPointerLockChangeFunction(GameLoop gameLoop);
typedef void GameLoopTouchEventFunction(GameLoop gameLoop, GameLoopTouch touch);


class Scene {
  GameLoopUpdateFunction onUpdate;
  GameLoopRenderFunction onRender;
  GameLoopResizeFunction onResize;
  GameLoopFullscreenChangeFunction onFullscreenChange;
  GameLoopPointerLockChangeFunction onPointerLockChange;
  GameLoopTouchEventFunction onTouchStart;
  GameLoopTouchEventFunction onTouchEnd;
}

