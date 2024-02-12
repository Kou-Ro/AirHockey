int windowWidth = 1500;
int windowHeight = 1000;

void settings() {
  size(windowWidth, windowHeight, P2D);
}

void setup() {
  info = new Info(windowWidth, windowHeight);
}

void draw() {
  background(Color.black);

  switch(mode) {
  case 0:
    startRoom();
    break;
  case 1:
    createRoom();
    break;
  case 2:
    joinRoom.draw(info);
    break;
  }
}