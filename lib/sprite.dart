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
      this.image = new ImageElement(src: src, width: width, height: height);
    }

    animate(currentTime) { 
      if ( this.currentFrame == this.totalFrames ) {
          this.currentFrame = 0;
      }
      this.currentFrame++;
      this.lastAnimationTime = currentTime;
    }

    num animationX() => this.currentFrame * this.width;
    num animationY() => this.currentFrame * this.height;
    bool readyToAnimate(num currentTime) => currentTime > lastAnimationTime+animationSpeed;
 
}
