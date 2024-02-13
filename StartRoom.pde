class StartRoom{
  private Info info;
  private float buttonWidth = 250, buttonHeight = 60, r = 0; // half of size
  private float positionX = 200, positionY = 100;
  private Button createRoomButton;
  private Button joinRoomButton;

  StartRoom(Info info){
    this.info = info;
    createRoomButton  = new Button("Create Room", info.centerX - positionX, info.centerY + positionY, buttonWidth, buttonHeight, Color.white, Color.black);
    joinRoomButton = new Button("Join Room", info.centerX + positionX, info.centerY + positionY, buttonWidth, buttonHeight, Color.white, Color.black);
  }

  void draw() {
    textSize(40);
    if(createRoomButton.draw()){
      createRoom = new CreateRoom(info);
      info.mode = 1;
    }
    if(joinRoomButton.draw()){
      joinRoom = new JoinRoom(info);
      info.mode = 2;
    }
  }
}

