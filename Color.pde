static class Color extends PApplet {
  static int white = getColor(255, 255, 255);
  static int black = getColor(0, 0, 0);
  static int lightGray = getColor(190, 190, 190);

  static int getColor(int r, int g, int b) {
    int red = (r < 0) ? 0 : (r > 255) ? 255 : r;
    int grean = (g < 0) ? 0 : (g > 255) ? 255 : g;
    int blue = (b < 0) ? 0 : (b > 255) ? 255 : b;

    return 0xFF << 24 | red << 16 | grean << 8 | blue;
  }

  static int getColor(int r, int g, int b, int base){
    return getColor(((base >> 16) & 0xFF) + r, ((base >> 8) & 0xFF) + g, (base & 0xFF) + b);
  }

  static int getColor(int l) {
    return getColor(l, l, l);
  }

  static int getColor(int l, int base){
    return getColor(l, l, l, base);
  }
}