class SetName{
  private Info info;
  private Button startButton;
  private char pressedKey = '\0';
  private char sameKeyCount = 0;
  private String name = "";

  SetName(Info info){
    this.info = info;
    textSize(40);
    startButton = new Button("Start", info.centerX, info.centerY + 200, Color.white, Color.black);
  }

  void draw(){
    if(startButton.draw() || (unmodefirePressed && key == ENTER && key != pressedKey)){
      sameKeyCount = 0;
      pressedKey = key;

      info.name = name;
      startRoom = new StartRoom(info);
      info.mode = 1;
    }

    if(unmodefirePressed && key != pressedKey){
      nameAdd(key);
      sameKeyCount = 0;
      pressedKey = key;
    }

    if(unmodefirePressed && key == pressedKey){
      sameKeyCount++;
      if(sameKeyCount > 60 && sameKeyCount % 5 == 0){
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
  }

  void nameAdd(char addKey){
    if(name.length() <= 15 && (addKey >= ' ' && addKey <= '~')){
      name += addKey;
    }
    else if(addKey == '\b' && name.length() > 0){
      name = name.substring(0, name.length() - 1);
    }
  }
}