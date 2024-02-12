class Button{
  private boolean pressed = false;
  private boolean clicked = false;
  private String message;
  private float x;
  private float y;
  private float w;
  private float h;
  private int bc;
  private int mc;
  private int dl;

  Button(String message, float x, float y, float w, float h, int bc, int mc, int dl){
    this.message = message;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.bc = bc;
    this.mc = mc;
    this.dl = dl;
  }

  Button(String message, float x, float y, int bc, int mc, int dl){
    this(message, x, y, textWidth(message), textAscent() + textDescent(), bc, mc, dl);
  }

  Button(String message, float x, float y, int w, int h, int bc, int mc){
    this(message, x, y, w, h, bc, mc, 60);
  }

  Button(String message, float x, float y, int bc, int mc){
    this(message, x, y, textWidth(message), textAscent() + textDescent(), bc, mc, 60);
  }

  boolean draw(){
    rectMode(CENTER);

    if((mouseX >= x - (w / 2) && mouseX <= x + (w / 2)) && (mouseY >= y - (h / 2) && mouseY <= y + (h / 2))){
      fill(Color.getColor(-dl, bc));
      rect(x, y, w, h);

      fill(Color.getColor(-dl, mc));
      text(message, x, y);

      if(pressed && !mousePressed){
        clicked = true;
      }

      if(mousePressed && mouseButton == LEFT){
        clicked = false;
        pressed = true;
      }
    }
    else{
      fill(bc);
      rect(x, y, w, h);

      fill(mc);
      text(message, x, y);
    }

    return clicked;
  }

  boolean isClicked(){
    return clicked;
  }
}