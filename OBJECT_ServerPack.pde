class ServerPack extends Pack{
  private Info info;
  private float spead = 5;
  private float angle = random(-QUARTER_PI, QUARTER_PI) + (int)random(2) * PI;
  private Paddle paddleS;
  private Paddle paddleC;
  private Goal goalS;
  private Goal goalC;

  ServerPack(Info info, float x, float y, Paddle paddleS, Paddle paddleC, Goal goalS, Goal goalC){
    super(x, y);
    this.info = info;
    this.paddleS = paddleS;
    this.paddleC = paddleC;
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
    paddleReflection(paddleS);
    paddleReflection(paddleC);
  }

  void goalCheck(){
    float goalH;

    goalH = goalS.getHeight();
    if(x <= r && y >= info.centerY - goalH / 2 && y <= info.centerY + goalH / 2){
      paddleC.incrementPoint();
      angle = random(-QUARTER_PI, QUARTER_PI) + (int)random(2) * PI;
      x = info.centerX;
      y = info.centerY;
    }

    goalH = goalC.getHeight();
    if(x >= info.windowWidth - r && y >= info.centerY - goalH / 2 && y <= info.centerY + goalH / 2){
      paddleS.incrementPoint();
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

  void paddleReflection(Paddle paddle){
    float paddleX = paddle.getX();
    float paddleY = paddle.getY();
    float paddleW = paddle.getWidth();
    float paddleH = paddle.getHeight();

    float distX = x - Math.max(paddleX - paddleW / 2, Math.min(paddleX + paddleW / 2, x));
    float distY = y - Math.max(paddleY - paddleH / 2, Math.min(paddleY + paddleH / 2, y));

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