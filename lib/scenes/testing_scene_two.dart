part of scenes;

class TestingSceneTwo implements Scene {
  Player player;
  List<Block> blocks;

  // this scene requires a player obj
  TestingSceneTwo(this.player) {
    blocks = new List();
    blocks.add(new Block(x: 100, y: 0, width: 50, height: 10));
    blocks.add(new Block(x: 150, y: 0, width: 50, height: 15));
    blocks.add(new Block(x: 200, y: 0, width: 50, height: 40));
  }

  GameUpdateFunction onUpdate(Game gameLoop) {
    for ( Block block in blocks ) {
      if ( block.collidable && player.x >= (block.x - block.width)
          && ( player.y - (block.y + block.height) <= 0 )
          ) {
        player.momentum = block.momentum;
      }
    }

    player.checkKeyStatus(gameLoop);
  }

  GameRenderFunction onRender(Game gameLoop) {
    CanvasRenderingContext2D context = gameLoop.element.context2D;
    context.clearRect(0,0,gameLoop.config['width'],gameLoop.config['height']);
    player.draw(context);
    for ( Block block in blocks ) {
      block.draw(context);
    }
  }

}
