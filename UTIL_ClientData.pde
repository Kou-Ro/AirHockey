class ClientData{
  private Client client;
  private String name;
  private int id;
  private boolean active = true;

  ClientData(Client client, String name, int id){
    this.client = client;
    this.name = name;
    this.id = id;
  }
}