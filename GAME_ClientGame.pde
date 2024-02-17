class ClientGame extends Game{
  ClientGame(Info info){
    super(info);
    pack = new Pack(info.centerX, info.centerY);
  }

  void procs(){
    String position = position;
    if(position != null && position != ""){
      String[] positions = position.split(":");

      if(positions.length == 8){
        barS.setX(Float.parseFloat(positions[0]));
        barS.setY(Float.parseFloat(positions[1]));
        barS.setPoint(Integer.parseInt(positions[2]));
        barC.setX(Float.parseFloat(positions[3]));
        barC.setY(Float.parseFloat(positions[4]));
        barC.setPoint(Integer.parseInt(positions[5]));
        pack.setX(Float.parseFloat(positions[6]));
        pack.setY(Float.parseFloat(positions[7]));
      }
    }
  }

  void upMove(){
    info.client.write("B!U\n");
  }

  void downMove(){
    info.client.write("B!D\n");
  }
}