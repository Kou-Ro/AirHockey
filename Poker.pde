int windowWidth = 1500;
int windowHeight = 1000;

void settings() {
  size(windowWidth, windowHeight, P2D);
}

void setup() {
  frameRate(60);
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
  }
}

void keyPressed(){
  unmodefirePressed();
}

void keyReleased(){
  unmodefireReleased();
}

void serverEvent(Server server, Client client){
  Thread clientHandlerThread = new Thread(new ClientHandler(client));
  clientHandlerThread.start();
}

void clientEvent(Client client){
  String data = client.readStringUntil('\n');
  if(data != null){
    data = data.substring(0, data.length() - 1);
    switch(data.substring(0, 2)){
      case "N?":
        client.write("N!" + (info.name != null ? info.name : "NULL") + "\n");
        break;
      case "I!":
        int id = Integer.parseInt(data.substring(2));
        info.id = id;
        println("id: " + id);
        break;
      case "N!":
        String name = data.substring(2);
        info.hostName = name;
        println("hostName: " + name);
        break;
      case "S!":
        println("Start Game");
        Poker.this.game = new Game(info);
        Poker.this.info.mode = 4;
        break;
      case "D!":
        joinRoom.active = false;
        println("Dissconnected");
        break;
      case "E!":
        println("ERRROR");
        exit();
    }
  }
}