float buttonWidth = 125, buttonHeight = 30, r = 0; // half of size
float positionX = 200, positionY = 100;

void startRoom() {
  rectMode(RADIUS);
  textAlign(CENTER, CENTER);
  textSize(40);
  createButton();
  joinButton();
}

void createButton() {
  float buttonCenterX = info.centerX - positionX;
  float buttonCenterY = info.centerY + positionY;

  if((mouseX >= buttonCenterX - buttonWidth && mouseX <= buttonCenterX + buttonWidth)&&
  (mouseY >= buttonCenterY - buttonHeight && mouseY <= buttonCenterY + buttonHeight)){
    fill(Color.lightGray);
    rect(buttonCenterX, buttonCenterY, buttonWidth, buttonHeight, r);

    if(mousePressed && mouseButton == LEFT){
      mode = 1;
    }
  }
  else{
    fill(Color.white);
    rect(buttonCenterX, buttonCenterY, buttonWidth, buttonHeight, r);
  }
  fill(Color.black);
  text("Create Room", buttonCenterX, buttonCenterY);
}

void joinButton(){
  float buttonCenterX = info.centerX + positionX;
  float buttonCenterY = info.centerY + positionY;

  if((mouseX >= buttonCenterX - buttonWidth && mouseX <= buttonCenterX + buttonWidth)&&
  (mouseY >= buttonCenterY - buttonHeight && mouseY <= buttonCenterY + buttonHeight)){
    fill(Color.lightGray);
    rect(buttonCenterX, buttonCenterY, buttonWidth, buttonHeight, r);

    if(mousePressed && mouseButton == LEFT){
      mode = 2;
      joinRoom = new JoinRoom();
    }
  }
  else{
    fill(Color.white);
    rect(buttonCenterX, buttonCenterY, buttonWidth, buttonHeight, r);
  }

  fill(Color.black);
  text("Join Room", buttonCenterX, buttonCenterY);
}

