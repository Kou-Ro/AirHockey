abstract class GameRect extends GameObject{
  protected Info info;
  protected float x;
  protected float y;
  protected float width;
  protected float height;
  protected int c;

  GameRect(Info info, float x, float y, float width, float height, int c){
    this.info = info;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.c = c;
  }

  void draw(){
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x, y, width, height);
  }

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

  float getWidth(){
    return this.width;
  }

  float getHeight(){
    return this.height;
  }
}