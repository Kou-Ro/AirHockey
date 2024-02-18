class ServerGame extends Game{

  ServerGame(Info info){
    super(info);
    pack = new ServerPack(info, info.centerX, info.centerY, barS, barC, goalS, goalC);
  }

  void procs(){
    positionWrite();
    checkWin();
  }

  void upMove(){
    barS.up();
  }

  void downMove(){
    barS.down();
  }

  void positionWrite(){
    String position = "";
    position += barS.getX() + ":";
    position += barS.getY() + ":";
    position += barS.getPoint() + ":";
    position += barC.getX() + ":";
    position += barC.getY() + ":";
    position += barC.getPoint() + ":";
    position += pack.getX() + ":";
    position += pack.getY() + ":";

    info.opponent.gameClient.send("P!" + position);
  }

  void checkWin(){
    if(barS.getPoint() >= 5){
      info.opponent.gameClient.send("L!");
      AirHockey.this.end = new End(info, true, Color.red);
      info.mode = 5;
    }
    else if(barC.getPoint() >= 5){
      info.opponent.gameClient.send("W!");
      AirHockey.this.end = new End(info, false, Color.red);
      info.mode = 5;
    }
  }

  void clientUp(){
    barC.up();
  }

  void clientDown(){
    barC.down();
  }
}