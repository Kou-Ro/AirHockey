class End{
  Info info;
  boolean isWin;
  int c;

  End(Info info, boolean isWin, int c){
    this.info = info;
    this.isWin = isWin;
    this.c = c;
  }

  void draw(){
    if(isWin){
      textSize(80);
      textAlign(CENTER, CENTER);
      fill(c);
      text("WIN", info.centerX, info.centerY);
    }
    else{
      textSize(80);
      textAlign(CENTER, CENTER);
      fill(c);
      text("LOSE", info.centerX, info.centerY);
    }
  }
}