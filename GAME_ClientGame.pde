class ClientGame extends Game{
  ClientGame(Info info){
    super(info);
    pack = new Pack(info.centerX, info.centerY);
  }

  void procs(){}

  void upMove(){
    info.client.write("B!U\n");
  }

  void downMove(){
    info.client.write("B!D\n");
  }
}