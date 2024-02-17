class CreateRoom {
  private Server server;
  private Client client;
  private Info info;
  private Button[] clientButtons = new Button[5];
  Boolean valid = false;

  CreateRoom(Info info){
    this.info = info;
    server = new Server(AirHockey.this, 8765);
    println("CreateRoom");
    info.isHost = true;
    info.hostIP = info.ipAddress;
    info.hostName = info.name;
    info.id = 0;

    textSize(60);
    for(int i = 0; i < 5; i++){
      clientButtons[i] = new Button("", info.centerX, info.centerY + (i * 100) , 500, 80, Color.lightGray, Color.black, 0);
    }
  }

  void draw(){
    textAlign(CENTER,CENTER);
    textSize(40);
    rectMode(CENTER);

    fill(Color.white);
    text("Room IP Address", info.centerX, info.centerY - 400);

    float ipWidth = textWidth(info.ipAddress + "  ");
    float ipHeight = textAscent() + textDescent();
    rect(info.centerX, info.centerY - 300, ipWidth, ipHeight);

    fill(Color.black);
    text(info.ipAddress, info.centerX, info.centerY - 300);

    fill(Color.white);
    text("Select the opponent", info.centerX, info.centerY - 100);

    int numOfClients = info.clients.size();
    textSize(60);
    for(int i = 0; i < 5; i++){
      if(i < numOfClients) {
        boolean active = info.clients.get(i).active;
        fill(Color.white);
        textSize(60);
        Button clientButton = clientButtons[i];
        clientButton.overwriteMessage(info.clients.get(i).name);
        if(active){
          clientButton.overwriteButtonColor(Color.white);
          clientButton.overwriteDarkLevel(60);
        }
        else{
          clientButton.overwriteButtonColor(Color.lightGray);
          clientButton.overwriteDarkLevel(0);
        }
        if(clientButton.draw() && active){
          info.opponent = info.clients.get(i);
          info.opponent.client.write("S!\n");
          int opponentID = info.opponent.id;
          info.clients.forEach((clientData) -> {
            if(clientData.id != opponentID && clientData.active){
              clientData.client.write("D!\n");
              clientData.client.stop();
              clientData.active = false;
              println("Dissconnect client. ID: " + clientData.id);
            }
          });
          AirHockey.this.game = new ServerGame(info);
          info.mode = 4;
        }
      }
      else{
        fill(Color.white);
        textSize(60);
        clientButtons[i].draw();
      }
    }

    for(int i = 0; i < numOfClients; i++){
      ClientData checkedClientData = info.clients.get(i);
      if(!checkedClientData.client.active() && checkedClientData.active){
        checkedClientData.active = false;
        println("Dissconnect client. ID: " + checkedClientData.id);
      }
    }
  }
}

class User {
  String ipAddress;

  User(String ipAddress){
    this.ipAddress = ipAddress;
  }
}