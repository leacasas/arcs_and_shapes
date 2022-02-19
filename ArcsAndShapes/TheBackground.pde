class TheBackground
{
  Circle[] circles;

  TheBackground() {
    int amount = round(random(2, 4));
    circles = new Circle[amount];
    for (int i = 0; i < amount; i++) {
      float x = random(100, width-100);
      float y = random(100, height-100);
      float d = min(width, height);
      float radius = random(d *0.23, d);
      int amountOfArcs = round(random(d/40.0, d/10.0));
      circles[i] = new Circle(x, y, radius, amountOfArcs, 0);
      circles[i].setAsBackground(BG_PALETTE);
    }
  }

  void draw()
  {
    for (Circle circle : circles) {
      circle.draw();
    }
  }
}
