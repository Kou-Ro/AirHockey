class ClientGame extends Game{
  ClientGame(Info info){
    super(info);
  }

  void procs(){
  }

  void upMove(){
    info.client.write("B!U\n");
  }

  void downMove(){
    info.client.write("B!D\n");
  }
}