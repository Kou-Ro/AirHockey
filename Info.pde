class Info {
  int windowWidth;
  int windowHeight;
  float centerX;
  float centerY;
  boolean initServer = false;
  boolean initClient = false;
  String ipAddress = "";
  String roomIP = "";
  String name = "";

  Info(int windowWidth, int windowHeight){
    this.windowWidth = windowWidth;
    this.windowHeight = windowHeight;
    this.centerX = (float)windowWidth / 2;
    this.centerY = (float)windowHeight / 2;
    this.ipAddress = Utils.getIP();
  }
}