int windowWidth = 1500;
int windowHeight = 1000;
float centerX = (float)windowWidth / 2;
float centerY = (float)windowHeight / 2;
int mode = 0; // 0: start, 1: createRoom, 2: joinRoom
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color lightGray = color(190, 190, 190);
String ipAddress;

import java.net.InetAddress;
String getIP(){
    String ipAddress;

  try {
    InetAddress inetAddress = InetAddress.getLocalHost();
    ipAddress = inetAddress.getHostAddress();
  }
  catch (Exception e) {
    e.printStackTrace();
    ipAddress = "Failed to retrieve the IP address";
  }

  return ipAddress;
}
