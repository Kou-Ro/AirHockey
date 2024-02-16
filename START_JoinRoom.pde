class JoinRoom {
  private Info info;
  private String hostIP = "";
  private String name = "";
  private char pressedKey = '\0';
  private char sameKeyCount = 0;
  private int mode = 0; // 0: Set name 1: set IP 2: waiting
  private Button nameSetButton;
  private Button hostIPSetButton;
  private Client client;
  private float loadingMisa = 0.0;
  boolean active = true;

  JoinRoom(Info info){
    this.info = info;
    this.nameSetButton = new Button("Next", info.centerX, info.centerY + 100, Color.white, Color.black);
    this.hostIPSetButton = new Button("Next", info.centerX, info.centerY + 100, Color.white, Color.black);
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
    if(hostIPSetButton.draw() || (unmodefirePressed && key == ENTER && key != pressedKey)){
      sameKeyCount = 0;
      pressedKey = key;

      info.hostIP = hostIP;
      client = new Client(Poker.this, info.hostIP, 8765);
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
    text(hostIP, info.centerX, info.centerY);
  }

  void waiting(){
    fill(Color.white);
    textAlign(CENTER,CENTER);
    rectMode(CENTER);
    textSize(40);
    text("Waiting for the host to start the game.", info.centerX, info.centerY - 200);

    textSize(60);
    textAlign(RIGHT, CENTER);
    text(info.name, info.centerX - 70, info.centerY);
    textAlign(CENTER, CENTER);
    text("VS", info.centerX, info.centerY);
    textAlign(LEFT, CENTER);
    text(info.hostName, info.centerX + 70, info.centerY);

    strokeWeight(10);
    stroke(Color.white);
    noFill();
    arc(info.centerX, info.centerY + 150, 100, 100, loadingMisa, loadingMisa + PI / 5, OPEN);
    fill(Color.white);
    noStroke();
    loadingMisa += PI / 30;
    loadingMisa %= TWO_PI;

    if(!client.active()){
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
    if(hostIP.length() <= 15 && ((addKey >= '0' && addKey <= '9') || addKey == '.')){
      hostIP += addKey;
    }
    else if(addKey == '\b' && hostIP.length() > 0){
      hostIP = hostIP.substring(0, hostIP.length() - 1);
    }
  }
}
