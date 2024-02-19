abstract class Game {
  protected Info info;
  protected Paddle paddleS;
  protected Paddle paddleC;
  protected Goal goalS;
  protected Goal goalC;
  protected int pressedKeyCode = -1;
  protected char sameKeyCount = 0;
  protected Pack pack;

  Game(Info info){
    this.info = info;
    this.paddleS = new Paddle(info, 100, info.centerY, Color.red);
    this.paddleC = new Paddle(info, info.windowWidth - 100, info.centerY, Color.blue);
    this.goalC = new Goal(info, 0, info.centerY, Color.red);
    this.goalS = new Goal(info, info.windowWidth, info.centerY, Color.blue);
  }

  abstract void procs();
  abstract void upMove();
  abstract void downMove();
  void clientUp(){}
  void clientDown(){}

  void draw(){
    procs();
    paddleMove();

    textSize(80);
    textAlign(CENTER, CENTER);
    fill(Color.red);
    text(paddleS.getPoint(), info.centerX / 2, info.centerY);
    fill(Color.blue);
    text(paddleC.getPoint(), (info.centerX / 2) * 3, info.centerY);

    paddleS.draw();
    paddleC.draw();
    goalS.draw();
    goalC.draw();
    pack.draw();
  }

  void paddleMove(){
    if(updownPressed && keyCode != pressedKeyCode){
      if(keyCode == UP){
        upMove();
      }else if(keyCode == DOWN){
        downMove();
      }

      sameKeyCount = 0;
      pressedKeyCode = keyCode;
    }

    if(updownPressed && keyCode == pressedKeyCode){
      if(sameKeyCount != 0 && sameKeyCount % 3 == 0){
        if(keyCode == UP){
          upMove();
        }
        else if(keyCode == DOWN){
          downMove();
        }
      }

      sameKeyCount++;
    }

    if(!updownPressed){
      pressedKeyCode = -1;
      sameKeyCount = 0;
    }
  }
}