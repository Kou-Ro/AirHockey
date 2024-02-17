class ServerPack extends Pack{
  private Info info;
  private float spead = 5;
  private float angle = random(-QUARTER_PI, QUARTER_PI) + (int)random(2) * PI;
  private Bar barS;
  private Bar barC;
  private Goal goalS;
  private Goal goalC;

  ServerPack(Info info, float x, float y, Bar barS, Bar barC, Goal goalS, Goal goalC){
    super(x, y);
    this.info = info;
    this.barS = barS;
    this.barC = barC;
    this.goalS = goalS;
    this.goalC = goalC;
  }

  void procs() {
    float speadX = spead * cos(angle);
    float speadY = spead * sin(angle);
    x += speadX;
    y += speadY;

    goalCheck();
    wallReflection();
    barReflection(barS);
    barReflection(barC);
  }

  void goalCheck(){
    float goalH;

    goalH = goalS.getHeight();
    if(x <= r && y >= info.centerY - goalH / 2 && y <= info.centerY + goalH / 2){
      barC.incrementPoint();
      angle = random(-QUARTER_PI, QUARTER_PI) + (int)random(2) * PI;
      x = info.centerX;
      y = info.centerY;
    }

    goalH = goalC.getHeight();
    if(x >= info.windowWidth - r && y >= info.centerY - goalH / 2 && y <= info.centerY + goalH / 2){
      barS.incrementPoint();
      angle = random(-QUARTER_PI, QUARTER_PI) + (int)random(2) * PI;
      x = info.centerX;
      y = info.centerY;
    }
  }

  void wallReflection(){
    if(x <= r || x >= info.windowWidth - r){
      angle = PI - angle;
    }

    if(y <= r || y >= info.windowHeight - r){
      angle = TWO_PI - angle;
    }
  }

  void barReflection(Bar bar){
    float barX = bar.getX();
    float barY = bar.getY();
    float barW = bar.getWidth();
    float barH = bar.getHeight();

    float distX = x - Math.max(barX - barW / 2, Math.min(barX + barW / 2, x));
    float distY = y - Math.max(barY - barH / 2, Math.min(barY + barH / 2, y));

    if(Math.pow(distX, 2) + Math.pow(distY, 2) <= Math.pow(r, 2)){
      if(distX >= distY){
        angle = PI - angle;
      }
      else{
        angle = TWO_PI - angle;
      }
    }
  }
}