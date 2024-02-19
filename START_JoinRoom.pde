class JoinRoom {
  private Info info;
  private String serverIP = "";
  private String name = "";
  private char pressedKey = '\0';
  private char sameKeyCount = 0;
  private int mode = 0; // 0: Set name 1: set IP 2: waiting
  private Button serverIPSetButton;
  private GameClient gameClient;
  private float loadingMisa = 0.0;
  boolean active = true;

  JoinRoom(Info info){
    this.info = info;
    this.serverIPSetButton = new Button("Next", info.centerX, info.centerY + 100, Color.white, Color.black);
    info.isClient = true;
  }

  void draw(){
    switch(mode){
      case 0:
        setIP();
        break;
      case 1:
        waiting();
        break;
      case 2:
        dissconnected();
        break;
    }
  }

  void setIP(){
    if(serverIPSetButton.draw() || (unmodefirePressed && key == ENTER && key != pressedKey)){
      sameKeyCount = 0;
      pressedKey = key;

      info.serverIP = serverIP;
      gameClient = new GameClient(info, new Client (AirHockey.this, info.serverIP, 8765));
      info.gameClient = gameClient;
      gameClient.startReceive();
      println("Join Room");
      mode = 1;
    }

    if(unmodefirePressed && key != pressedKey){
      ipAdd(key);
      sameKeyCount = 0;
      pressedKey = key;
    }

    if(unmodefirePressed && key == pressedKey){
      sameKeyCount++;

      if(sameKeyCount > 60 && sameKeyCount % 5 == 0){
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
    text(serverIP, info.centerX, info.centerY);
  }

  void waiting(){
    fill(Color.white);
    textAlign(CENTER,CENTER);
    rectMode(CENTER);
    textSize(40);
    text("Waiting for the host to start the game.", info.centerX, info.centerY - 200);

    textSize(60);
    textAlign(RIGHT, CENTER);
    fill(Color.red);
    text(info.serverName, info.centerX - 100, info.centerY);
    textAlign(CENTER, CENTER);
    fill(Color.white);
    text("VS", info.centerX, info.centerY);
    textAlign(LEFT, CENTER);
    fill(Color.blue);
    text(info.name, info.centerX + 100, info.centerY);

    strokeWeight(10);
    stroke(Color.white);
    noFill();
    arc(info.centerX, info.centerY + 150, 100, 100, loadingMisa, loadingMisa + PI / 5, OPEN);
    fill(Color.white);
    noStroke();
    loadingMisa += PI / 60;
    loadingMisa %= TWO_PI;

    if(!gameClient.getClient().active()){
      gameClient.stopReceive();
      active = false;
    }

    if(!active){
      mode = 2;
    }
  }

  void dissconnected() {
    textSize(60);
    textAlign(CENTER, CENTER);
    text("Dissconnected", info.centerX, info.centerY);
  }


  void ipAdd(char addKey){
    if(serverIP.length() <= 15 && ((addKey >= '0' && addKey <= '9') || addKey == '.')){
      serverIP += addKey;
    }
    else if(addKey == '\b' && serverIP.length() > 0){
      serverIP = serverIP.substring(0, serverIP.length() - 1);
    }
  }
}
