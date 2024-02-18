class ClientGame extends Game{
  ClientGame(Info info){
    super(info);
    pack = new Pack(info.centerX, info.centerY);
  }

  void procs(){
    String position = info.position;
    if(position != null && position != ""){
      String[] positions = position.split(":");

      if(positions.length == 8){
        paddleS.setX(Float.parseFloat(positions[0]));
        paddleS.setY(Float.parseFloat(positions[1]));
        paddleS.setPoint(Integer.parseInt(positions[2]));
        paddleC.setX(Float.parseFloat(positions[3]));
        paddleC.setY(Float.parseFloat(positions[4]));
        paddleC.setPoint(Integer.parseInt(positions[5]));
        pack.setX(Float.parseFloat(positions[6]));
        pack.setY(Float.parseFloat(positions[7]));
      }
    }
  }

  void upMove(){
    info.gameClient.send("B!U");
  }

  void downMove(){
    info.gameClient.send("B!D");
  }
}