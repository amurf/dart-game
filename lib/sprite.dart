import 'dart:html';

class Sprite {
    num totalFrames; // this starts at 0
    num animationSpeed;
    num width;
    num height;
    num currentFrame = 0;
    num lastAnimationTime = 0;

    ImageElement image;

    Sprite(src, {this.width, this.height, this.totalFrames, this.animationSpeed}) {
      image = new ImageElement(src: src, width: width, height: height);
    }

    void animate(currentTime) {
      if ( currentFrame == totalFrames ) {
          currentFrame = 0;
      }
      currentFrame++;
      lastAnimationTime = currentTime;
    }

    void draw(context, x, y) {
        context.drawImageScaledFromSource(image, animationX(), animationY(), width, height, x, y, width, height);
    }

    num animationX() => currentFrame * width;
    // todo: sort this y animation out
    num animationY() => 0 * height;
    bool readyToAnimate(num currentTime) => currentTime > lastAnimationTime+animationSpeed;

}
