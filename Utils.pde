static class Utils{
  static String getIP(){
    String ipAddress = "";

    try {
      Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
      while (interfaces.hasMoreElements()) {
        NetworkInterface iface = interfaces.nextElement();
        // Skip loop back interfaces
        if (iface.isLoopback() || !iface.isUp()) {
          continue;
        }
        Enumeration<InetAddress> addresses = iface.getInetAddresses();
        while (addresses.hasMoreElements()) {
          InetAddress addr = addresses.nextElement();
          // Get only IPv4 addresses
          if (addr.getAddress().length == 4) {
            ipAddress = addr.getHostAddress();
          }
        }
      }
    }
    catch (Exception e) {
      e.printStackTrace();
      ipAddress = "Failed to retrieve the IP address";
    }

    return ipAddress;
  }
}