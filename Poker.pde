void settings() {
  size(windowWidth, windowHeight, P2D);
}

void setup() {
  ipAddress = getIP();
}

void draw() {
  background(black);

  switch(mode) {
  case 0:
    startRoom();
    break;
  case 1:
    createRoom();
    break;
  }
}