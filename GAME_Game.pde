abstract class Game {
  protected Info info;
  protected Bar barS;
  protected Bar barC;
  protected Goal goalS;
  protected Goal goalC;
  protected int pressedKeyCode = -1;
  protected char sameKeyCount = 0;
  protected Pack pack;

  Game(Info info){
    this.info = info;
    this.barS = new Bar(info, 100, info.centerY, Color.red);
    this.barC = new Bar(info, info.windowWidth - 100, info.centerY, Color.blue);
    this.goalC = new Goal(info, 0, info.centerY, Color.red);
    this.goalS = new Goal(info, info.windowWidth, info.centerY, Color.blue);
    this.pack = new Pack(info, info.centerX, info.centerY, barS, barC, goalS, goalC);
  }

  abstract void procs();
  abstract void upMove();
  abstract void downMove();

  void draw(){
    procs();
    barMove();

    barS.draw();
    barC.draw();
    goalS.draw();
    goalC.draw();
    pack.draw();
  }

  void barMove(){
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