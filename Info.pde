class Info {
  int mode;
  int windowWidth;
  int windowHeight;
  float centerX;
  float centerY;
  boolean initServer = false;
  boolean initClient = false;
  String ipAddress = "";
  String roomIP = "";
  String name = "";
  int id;
  List<ClientData> clients = new ArrayList<ClientData>();

  Info(int windowWidth, int windowHeight){
    this.mode = 0;
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
    this.centerX = (float)windowWidth / 2;
    this.centerY = (float)windowHeight / 2;
    this.ipAddress = Utils.getIP();
  }
}