class Construct {
  Circle mainCircle;
  Circle[] outerRing, innerRing;

  Construct(PVector position) {
    float size = min(width, height) / 5.0;
    size = random(size*.25, size*0.5);
    int arcCount = round(random(size/4.0, size/2.0));
    mainCircle = new Circle(position.x, position.y, size, arcCount, random(360));
    mainCircle.alpha = 110;

    int outerRingCircCount = round(random(4,20));
    outerRing = new Circle[outerRingCircCount];
    for (int i = 0; i < outerRingCircCount; i++) {
      float a = random(TWO_PI);
      float x = position.x + cos(a) * size;
      float y = position.y + sin(a) * size;
      float ss = size * random(0.2, 0.4);
      outerRing[i] = new Circle(x, y, ss, round(random(3, 8)), random(360));
      outerRing[i].alpha = 96;
    }
    
    int innerRingCircCount = round(random(0,5));
    innerRing = new Circle[innerRingCircCount];
    float innerSize = mainCircle._radialCut;
    for (int i = 0; i < innerRingCircCount; i++) {
      float a = random(TWO_PI);
      float x = position.x + cos(a) * innerSize;
      float y = position.y + sin(a) * innerSize;
      float ss = size * random(0.1, 0.25);
      innerRing[i] = new Circle(x, y, ss, round(random(2, 5)), random(360));
      innerRing[i].alpha = 96;
    }
  }

  void draw() {
    mainCircle.draw();

    for (Circle ringCirc : outerRing) {
      ringCirc.draw();
    }
    
    for (Circle ringCirc : innerRing) {
      ringCirc.draw();
    }
  }
}
