class Info {
  int mode;
  int windowWidth;
  int windowHeight;
  float centerX;
  float centerY;
  boolean initServer = false;
  boolean initClient = false;
  String ipAddress = "";
  String name = "";
  String serverIP = "";
  String serverName = "";
  int id;
  boolean isServer = false;
  boolean isClient = false;
  ClientData opponent;
  List<ClientData> clients = new ArrayList<ClientData>();
  GameClient gameClient;
  String position = "";

  Info(int windowWidth, int windowHeight){
    this.mode = 0;
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
    this.centerX = (float)windowWidth / 2;
    this.centerY = (float)windowHeight / 2;
    this.ipAddress = Utils.getIP();
  }
}