void createRoom(){
  if(!info.initServer){
    server = new Server(this, 8765);
    info.initServer = true;
  }

  client = server.available();
  if(client != null){
    String data = client.readString();
    println(data);
    client.write("Hello, I'm a server");
    client.stop();
  }

  textAlign(CENTER,CENTER);
  textSize(40);
  rectMode(CENTER);

  fill(Color.white);
  text("Room IP Address", info.centerX, info.centerY - 300);

  float ipWidth = textWidth(info.ipAddress);
  float ipHeight = textAscent() + textDescent();
  rect(info.centerX, info.centerY - 200, ipWidth, ipHeight);

  fill(Color.black);
  text(info.ipAddress, info.centerX, info.centerY - 200);

}

class User {
  String ipAddress;

  User(String ipAddress){
    this.ipAddress = ipAddress;
  }
}