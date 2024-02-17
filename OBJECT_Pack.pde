class Pack extends GameObject{
  protected float x;
  protected float y;
  protected float r = 15;

  Pack(float x, float y){
    this.x = x;
    this.y = y;
  }

  void draw(){
    noStroke();
    fill(Color.white);
    procs();
    circle(x, y, r);
  }

  void procs(){}

  float getX(){
    return this.x;
  }

  float setX(float x){
    this.x = x;
    return this.x;
  }

  float getY(){
    return this.y;
  }

  float setY(float y){
    this.y = y;
    return this.y;
  }
}