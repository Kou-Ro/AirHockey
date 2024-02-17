class BarHandler implements Runnable{
  Info info;
  Bar barC;

  BarHandler(Info info, Bar barC){
    this.info = info;
    this.barC = barC;
  }

  public void run(){
    while(true){
      Client client = info.opponent.client;
      int availableCount = client.available();
      if(availableCount >= 4){
        String data = client.readStringUntil('\n');
        if(data != null){
          data = data.substring(0, data.length() - 1);
          String dataHead = data.substring(0,2);
          String dataValue = data.substring(2);

          switch(dataHead){
            case "B!":
              if(dataValue.equals("U")){
                barC.up();
              }
              else if(dataValue.equals("D")){
                barC.down();
              }
              break;
            case "K!":
              return;
            case "T!":
              println(dataValue);
              break;
          }
        }
      }
    }
  }
}