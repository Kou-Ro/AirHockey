void createRoom(){
  textAlign(CENTER,CENTER);
  textSize(40);
  rectMode(CENTER);

  fill(white);
  text("Your IP Address", centerX, centerY - 300);

  float ipWidth = textWidth(ipAddress);
  float ipHeight = textAscent() + textDescent();
  rect(centerX, centerY - 200, ipWidth, ipHeight);

  fill(black);
  text(ipAddress, centerX, centerY - 200);

}

class User {
  String ipAddress;

  User(String ipAddress){
    this.ipAddress = ipAddress;
  }


}