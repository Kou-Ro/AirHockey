static class Utils{
  static String getIP(){
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
}