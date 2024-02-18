import java.nio.ByteBuffer;

class GameClient{
  Info info;
  Client client;
  Thread readBuffer;

  GameClient(Info info, Client client){
    this.info = info;
    this.client = client;
    readBuffer = new Thread(new ReadBuffer(info, this));
  }

  Client getClient(){
    return this.client;
  }

  void send(String message){
    int byts = message.getBytes().length;
    byte[] data = (new String(ByteBuffer.allocate(4).putInt(byts).array()) + message).getBytes();
    client.write(data);
  }

  void startReceive(){
    readBuffer.start();
  }

  void stopReceive(){
    readBuffer.stop();
  }

  class ReadBuffer implements Runnable{
    Info info;
    GameClient gameClient;
    Client client;

    ReadBuffer(Info info, GameClient gameClient){
      this.info = info;
      this.gameClient = gameClient;
      this.client = gameClient.getClient();
    }

    public void run(){
      println("ReadBuffer start");

      while(true){
        if(!client.active()){
          println("Client is not active");
          return;
        }

        int bufferLength;
        bufferLength = client.available();
        if(bufferLength >= 4){
          byte[] dataLengthByts = client.readBytes(4);
          int dataLength = ByteBuffer.wrap(dataLengthByts).getInt();
          println("Data length: " + dataLength);

          while(true){
            if(!client.active()){
              println("Client is not active");
              return;
            }

            bufferLength = client.available();
            if(bufferLength >= dataLength){
              String data = new String(client.readBytes(bufferLength));
              String dataHead = data.substring(0, 2);
              String dataBody = data.substring(2) != null ? data.substring(2) : "";
              println("DataHead:" + dataHead + " DataBody: " + dataBody);

              switch(dataHead){
                case "N?":
                  println("Answer Name");
                  gameClient.send("N!" + (info.name != null ? info.name : "NULL"));
                  break;
                case "N!":
                  println("N case");
                  if(info.isServer){
                    int id = info.clients.size() + 1;
                    info.clients.add(new ClientData(GameClient.this, dataBody, id));
                    gameClient.send("I!" + Integer.toString(id));
                    gameClient.send("N!" + info.name);
                    println("Add a client\nid: " + id + "\nname: " + dataBody);
                  }
                  else if(info.isClient){
                    info.serverName = dataBody;
                    println("ServerName: " + dataBody);
                  }
                  else{
                    println("else case");
                  }
                  break;
                case "I!":
                  info.id = Integer.parseInt(dataBody);
                  println("ID: " + dataBody);
                  break;
                case "S!":
                  println("Start Game");
                  AirHockey.this.game = new ClientGame(info);
                  AirHockey.this.info.mode = 4;
                  break;
                case "D!":
                  AirHockey.this.joinRoom.active = false;
                  println("Dissconected");
                  break;
                case "P!":
                  info.position = dataBody;
                  break;
                case "B!":
                  if(dataBody.equals("U")){
                    AirHockey.this.game.clientUp();
                  }
                  else if(dataBody.equals("D")){
                    AirHockey.this.game.clientDown();
                  }
                  break;
                case "W!":
                  AirHockey.this.end = new End(info, true, Color.blue);
                  gameClient.send("K!");
                  info.mode = 5;
                  break;
                case "L!":
                  AirHockey.this.end = new End(info, false, Color.blue);
                  gameClient.send("K!");
                  info.mode = 5;
                  break;
                case "K!":
                   return;
                case "T!":
                  println(dataBody);
                  break;
                case "E!":
                  println("ERRROR");
                  break;
              }
              break;
            }
          }
        }
      }
    }
  }
}