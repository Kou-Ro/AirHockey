class ServerGame extends Game{

  ServerGame(Info info){
    super(info);
    pack = new ServerPack(info, info.centerX, info.centerY, paddleS, paddleC, goalS, goalC);
  }

  void procs(){
    positionWrite();
    checkWin();
  }

  void upMove(){
    paddleS.up();
  }

  void downMove(){
    paddleS.down();
  }

  void positionWrite(){
    String position = "";
    position += paddleS.getX() + ":";
    position += paddleS.getY() + ":";
    position += paddleS.getPoint() + ":";
    position += paddleC.getX() + ":";
    position += paddleC.getY() + ":";
    position += paddleC.getPoint() + ":";
    position += pack.getX() + ":";
    position += pack.getY() + ":";

    info.opponent.gameClient.send("P!" + position);
  }

  void checkWin(){
    if(paddleS.getPoint() >= 5){
      info.opponent.gameClient.send("L!");
      AirHockey.this.end = new End(info, true, Color.red);
      info.mode = 5;
    }
    else if(paddleC.getPoint() >= 5){
      info.opponent.gameClient.send("W!");
      AirHockey.this.end = new End(info, false, Color.red);
      info.mode = 5;
    }
  }

  void clientUp(){
    paddleC.up();
  }

  void clientDown(){
    paddleC.down();
  }
}