class JoinRoom {
  private Info info;
  private String roomIP;
  private String name;
  private char pressedKey = '\0';
  private char sameKeyCount = 0;
  private int mode = 0; // 0: Set name 1: set IP 2: waiting
  private Button nameSetButton;
  private Button roomIPSetButton;
  private Client client;

  JoinRoom(Info info){
    this.info = info;
    this.roomIP = "";
    this.name = "";
    this.nameSetButton = new Button("Next", info.centerX, info.centerY + 100, Color.white, Color.black);
    this.roomIPSetButton = new Button("Next", info.centerX, info.centerY + 100, Color.white, Color.black);
  }

  void draw(){
    switch(mode){
      case 0:
        setName();
        break;
      case 1:
        setIP();
        break;
      case 2:
        waiting();
        break;
    }
  }

  void setName(){
    if(unmodefirePressed && key != pressedKey){
      nameAdd(key);
      sameKeyCount = 0;
      pressedKey = key;
    }

    if(unmodefirePressed && key == pressedKey){
      sameKeyCount++;
      if(sameKeyCount > 30 && sameKeyCount % 3 == 0){
        nameAdd(key);
      }
    }

    if(!unmodefirePressed){
      pressedKey = '\0';
      sameKeyCount = 0;
    }

    textAlign(CENTER,CENTER);
    textSize(40);
    rectMode(CENTER);
    fill(Color.white);

    text("Enter your name.", info.centerX, info.centerY - 100);

    float BoxHeight = textAscent() + textDescent();
    rect(info.centerX, info.centerY, 400, BoxHeight);

    fill(Color.black);
    text(name, info.centerX, info.centerY);

    if(nameSetButton.draw()){
      info.name = name;
      mode = 1;
    }
  }

  void setIP(){
    if(unmodefirePressed && key != pressedKey){
      ipAdd(key);
      sameKeyCount = 0;
      pressedKey = key;
    }

    if(unmodefirePressed && key == pressedKey){
      sameKeyCount++;

      if(sameKeyCount > 30 && sameKeyCount % 3 == 0){
        ipAdd(key);
      }
    }

    if(!unmodefirePressed){
      pressedKey = '\0';
      sameKeyCount = 0;
    }

    textAlign(CENTER,CENTER);
    textSize(40);
    rectMode(CENTER);
    fill(Color.white);

    text("Enter the room IP address.", info.centerX, info.centerY - 100);

    float BoxHeight = textAscent() + textDescent();
    rect(info.centerX, info.centerY, 400, BoxHeight);

    fill(Color.black);
    text(roomIP, info.centerX, info.centerY);

    if(roomIPSetButton.draw()){
      info.roomIP = roomIP;
      client = new Client(Poker.this, info.roomIP, 8765);
      println("Join Room");
      mode = 2;
    }
  }

  void waiting(){
  }

  void nameAdd(char addKey){
    if(name.length() <= 15 && (addKey >= ' ' && addKey <= '~')){
      name += addKey;
    }
    else if(addKey == '\b' && name.length() > 0){
      name = name.substring(0, name.length() - 1);
    }
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
