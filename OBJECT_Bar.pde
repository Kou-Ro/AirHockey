class Bar extends GameRect{
  Bar(Info info, float x, float y, int c) {
    super(info, x, y, 10, 150, c);
  }

  void up(){
   if(y > height / 2){
      y -= 30;
    }
  }

  void down(){
    if(y < info.windowHeight - height / 2){
      y += 30;
    }
  }
}