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
  GameClient gameClient = new GameClient(info, client);
  gameClient.startReceive();
  gameClient.send("N?");
}