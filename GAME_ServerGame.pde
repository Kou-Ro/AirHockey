class ServerGame extends Game{
  ServerGame(Info info){
    super(info);
    pack = new ServerPack(info, info.centerX, info.centerY, barS, barC, goalS, goalC);
  }

  void procs(){
    barRequest();
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
}