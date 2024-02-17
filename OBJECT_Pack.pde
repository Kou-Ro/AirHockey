class Pack extends GameObject{
  private Info info;
  private float x;
  private float y;
  private float r = 15;
  private float spead = 10;
  private float angle = random(-QUARTER_PI, QUARTER_PI) + (int)random(2) * PI;
  protected Bar barS;
  protected Bar barC;
  protected Goal goalS;
  protected Goal goalC;

  Pack(Info info, float x, float y, Bar barS, Bar barC, Goal goalS, Goal goalC){
    this.info = info;
    this.x = x;
    this.y = y;
    this.barS = barS;
    this.barC = barC;
    this.goalS = goalS;
    this.goalC = goalC;
  }

  void draw(){
    noStroke();
    fill(Color.white);

    float speadX = spead * cos(angle);
    float speadY = spead * sin(angle);

    x += speadX;
    y += speadY;

    goalCheck();
    wallReflection();
    barReflection(barS);
    barReflection(barC);

    circle(x, y, r);
  }

  void goalCheck(){
    float goalH;

    goalH = goalS.getHeight();
    if(x <= r && y >= info.centerY - goalH / 2 && y <= info.centerY + goalH / 2){
      barC.incrementPoint();
      angle = random(TWO_PI);
      x = info.centerX;
      y = info.centerY;
    }

    goalH = goalC.getHeight();
    if(x >= info.windowWidth - r && y >= info.centerY - goalH / 2 && y <= info.centerY + goalH / 2){
      barS.incrementPoint();
      angle = random(TWO_PI);
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

    if(x <= barX + barW / 2 + r && x >= barX - barW / 2 - r && y < barY + barH / 2 + r && y > barY - barH / 2 - r){
      angle = PI - angle;
    }

    if(y <= barY + barH / 2 + r && y >= barY - barH / 2 - r && x < barX + barW / 2 + r && x > barX - barW / 2 - r){
      angle = TWO_PI - angle;
    }
  }

  float getX(){
    return this.x;
  }

  float getY(){
    return this.y;
  }
}