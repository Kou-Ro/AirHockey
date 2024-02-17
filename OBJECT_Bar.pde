class Bar extends GameRect{
  private int point = 0;

  Bar(Info info, float x, float y, int c) {
    super(info, x, y, 15, 100, c);
  }

  void up(){
   if(y > height / 2){
      y -= 15;
    }
  }

  void down(){
    if(y < info.windowHeight - height / 2){
      y += 15;
    }
  }

  int getPoint(){
    return point;
  }

  int setPoint(int point){
    this.point = point;
    return point;
  }

  int incrementPoint(){
    point++;
    return point;
  }
}