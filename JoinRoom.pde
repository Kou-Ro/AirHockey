class JoinRoom{
  String roomIP;
  String name;
  char pressedKey = '\0';
  char sameKeyCount = 0;

  JoinRoom(){
    this.roomIP = "";
    this.name = "";
  }

  void draw(Info info){
    if(keyPressed && key != pressedKey){
      ipAdd(key);
      sameKeyCount = 0;
      pressedKey = key;
    }

    if(keyPressed && key == pressedKey){
      sameKeyCount++;

      if(sameKeyCount > 25 && sameKeyCount % 3 == 0){
        ipAdd(key);
      }
    }

    if(!keyPressed){
      pressedKey = '\0';
      sameKeyCount = 0;
    }

    textAlign(CENTER,CENTER);
    textSize(40);
    rectMode(CENTER);
    fill(Color.white);

    text("Enter the room IP address.", info.centerX, info.centerY - 300);

    float ipBoxHeight = textAscent() + textDescent();
    rect(info.centerX, info.centerY - 200, 400, ipBoxHeight);

    fill(Color.black);
    text(roomIP, info.centerX, info.centerY - 200);
  }

  void ipAdd(char addKey){
    if(roomIP.length() <= 15 && ((addKey >= '0' && addKey <= '9') || addKey == '.')){
      roomIP += addKey;
    }
    else if(addKey == '\b' && roomIP.length() > 0){
      roomIP = roomIP.substring(0, roomIP.length() - 1);
    }
  }
}
