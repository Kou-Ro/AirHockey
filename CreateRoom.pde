class CreateRoom {
  private Server server;
  private Client client;
  private Info info;

  CreateRoom(Info info){
    this.info = info;
    server = new Server(Poker.this, 8765);
    println("CreateRoom");
    info.roomIP = info.ipAddress;
    info.id = 0;
  }

  void draw(){
    textAlign(CENTER,CENTER);
    textSize(40);
    rectMode(CENTER);

    fill(Color.white);
    text("Room IP Address", info.centerX, info.centerY - 300);

    float ipWidth = textWidth(info.ipAddress);
    float ipHeight = textAscent() + textDescent();
    rect(info.centerX, info.centerY - 200, ipWidth, ipHeight);

    fill(Color.black);
    text(info.ipAddress, info.centerX, info.centerY - 200);
  }
}

class User {
  String ipAddress;

  User(String ipAddress){
    this.ipAddress = ipAddress;
  }
}