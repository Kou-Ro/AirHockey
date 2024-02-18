class ClientData{
  private GameClient gameClient;
  private Client client;
  private String name;
  private int id;
  private boolean active = true;

  ClientData(GameClient gameClient, String name, int id){
    this.gameClient = gameClient;
    this.client = gameClient.getClient();
    this.name = name;
    this.id = id;
  }
}