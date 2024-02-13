class ClientHandler implements Runnable {
  Client client;

  ClientHandler(Client client){
    this.client = client;
  }

  public void run(){
    client.write("N?\n");

    while(true){
      if(client.available() >= 2){
        String data = client.readStringUntil('\n');
        data = data.substring(0, data.length() - 1);
        println(data);
        if(data.substring(0, 2).equals("N!")){
          int id = info.clients.size() + 1;
          info.clients.add(new ClientData(client, data.substring(2), id));
          client.write("I!" + Integer.toString(id) + "\n");

          println("Added a client\nid: " + id);
          break;
        }
        else{
          client.write("E!/");
          break;
        }
      }
    }
  }
}