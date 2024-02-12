static class Color extends PApplet {
  static int white = getColor(255, 255, 255);
  static int black = getColor(0, 0, 0);
  static int lightGray = getColor(190, 190, 190);

  static int getColor(int r, int g, int b) {
    return 0xFF << 24 | r << 16 | g << 8 | b;
  }
}