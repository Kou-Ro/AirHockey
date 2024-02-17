class ServerGame extends Game{
  ServerGame(Info info){
    super(info);
    pack = new ServerPack(info, info.centerX, info.centerY, barS, barC, goalS, goalC);
  }

  void procs(){
    barRequest();
    positionWrite();
    checkWin();
  }

  void upMove(){
    barS.up();
  }

  void downMove(){
    barS.down();
  }

  void barRequest(){
    Thread barHandler = new Thread(new BarHandler(info, barC));
    barHandler.start();
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

    info.opponent.client.write("P!" + position + "\n");
  }

  void checkWin(){
    if(barS.getPoint() >= 5){
      info.opponent.client.write("L!\n");
      Poker.this.end = new End(info, true, Color.red);
      info.mode = 5;
    }
    else if(barC.getPoint() >= 5){
      info.opponent.client.write("W!\n");
      Poker.this.end = new End(info, false, Color.red);
      info.mode = 5;
    }
  }
}