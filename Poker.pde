int windowWidth = 1500;
int windowHeight = 1000;

void settings() {
  size(windowWidth, windowHeight, P2D);
}

void setup() {
  frameRate(60);
  info = new Info(windowWidth, windowHeight);
  startRoom = new StartRoom(info);
}

void draw() {
  background(Color.black);

  switch(info.mode) {
  case 0:
    startRoom.draw();
    break;
  case 1:
    createRoom.draw();
    break;
  case 2:
    joinRoom.draw();
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
      case "E!":
        println("ERRROR");
        exit();
    }
  }
}