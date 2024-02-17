int windowWidth = 1500;
int windowHeight = 1000;

void settings() {
  size(windowWidth, windowHeight, P2D);
}

void setup() {
  frameRate(120);
  info = new Info(windowWidth, windowHeight);
  setName = new SetName(info);
}

void draw() {
  background(Color.black);
  noStroke();

  switch(info.mode) {
    case 0:
      setName.draw();
      break;
    case 1:
      startRoom.draw();
      break;
    case 2:
      createRoom.draw();
      break;
    case 3:
      joinRoom.draw();
      break;
    case 4:
      game.draw();
      break;
    case 5:
      end.draw();
      break;
  }
}

void keyPressed(){
  keyPressCheck();
}

void keyReleased(){
  keyReleaseCheck();
}

void serverEvent(Server server, Client client){
  println("Server event");
  Thread clientHandlerThread = new Thread(new ClientHandler(client));
  clientHandlerThread.start();
}

void clientEvent(Client client){
  String data = client.readStringUntil('\n');
  while(true){
    if(data != null){
      data = data.substring(0, data.length() - 1);
      String dataHead = data.substring(0, 2);
      String dataValue = data.substring(2);
      switch(dataHead){
        case "N?":
          client.write("N!" + (info.name != null ? info.name : "NULL") + "\n");
          break;
        case "I!":
          int id = Integer.parseInt(dataValue);
          info.id = id;
          println("id: " + id);
          break;
        case "N!":
          String name = dataValue;
          info.hostName = name;
          println("hostName: " + name);
          break;
        case "S!":
          println("Start Game");
          AirHockey.this.game = new ClientGame(info);
          AirHockey.this.info.mode = 4;
          break;
        case "D!":
          joinRoom.active = false;
          println("Dissconnected");
          break;
        case "P!":
          info.position = dataValue;
          break;
        case "W!":
          AirHockey.this.end = new End(info, true, Color.blue);
          client.write("K!\n");
          info.mode = 5;
          break;
        case "L!":
          AirHockey.this.end = new End(info, false, Color.blue);
          client.write("K!\n");
          info.mode = 5;
          break;
        case "T!":
          println(dataValue);
          break;
        case "E!":
          println("ERRROR");
          break;
      }
    }
    break;
  }
}