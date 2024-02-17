class ServerGame extends Game{
  ServerGame(Info info){
    super(info);
    pack = new ServerPack(info, info.centerX, info.centerY, barS, barC, goalS, goalC);
  }

  void procs(){
    barRequest();
    positionWrite();
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
}