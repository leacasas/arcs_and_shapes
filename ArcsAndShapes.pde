int NUMBEROFARCS = 0;
int NUMBEROFCIRCLES = 12000;
int NUMBEROFCONSTRUCTS = 1;

color[] PALETTE;
color[] BG_PALETTE;

TheBackground thebg;

PVector[] constructOrigins;

Arc[] arcs;
Circle[] circles;
Construct[] constructs;

void setup() {
  PALETTE = TravelerPallete;
  BG_PALETTE = BeachBall;

  size(1200, 1000, P3D);
  //fullScreen(P3D);
  smooth(16);

  reset();
}

void draw() {
  background(242);
  //thebg.draw();

  for (Arc arc : arcs) {
    arc.draw();
  }

  for (Circle circle : circles) {
    circle.draw();
  }

  for (Construct construct : constructs) {
    construct.draw();
  }
}

void reset() {
  background(242);
  noiseDetail(8, 0.5);

  thebg = new TheBackground();

  //NUMBEROFCONSTRUCTS = thebg.circles.length;
  NUMBEROFCONSTRUCTS = 0;
  constructOrigins = new PVector[NUMBEROFCONSTRUCTS];
  for (int i = 0; i < NUMBEROFCONSTRUCTS; i++)
    constructOrigins[i] = thebg.circles[i]._position;

  arcs = new Arc[NUMBEROFARCS];

  for (int i = 0; i < NUMBEROFARCS; i++) {
    //float x = random (50, width - 50);
    float x = width * 0.5 + (randomGaussian() * (width * 0.1));
    //float y = random (50, height - 50);
    float y = height * 0.5 + (randomGaussian() * (height * 0.1));

    //float distToCenter = dist(x, y, width/2.0, height/2.0);

    //float outer = random(8, 90);
    float outer = abs(randomGaussian() * 45);
    //float outer =  map(distToCenter, 0, 400, 100, 4);
    float inner = outer * random(0.25, 0.75);

    float arcSize = 180;
    float rotation = random(0, 360);
    //float rotation = noise(x, y) * 15;
    Arc arc = new Arc(x, y, outer, inner, arcSize, rotation);
    arcs[i] = arc;
  }

  circles = new Circle[NUMBEROFCIRCLES];

  for (int i = 0; i < NUMBEROFCIRCLES; i++) {

//    float a = random(TWO_PI);
    //float s = round(random(0,3)) * 120;
    //float x = width/2.0 + cos(a) * s;
    //float y = height/2.0 + sin(a) * s;

    //float x = random (50, width - 50);
    float x = width * 0.5 + (randomGaussian() * (width * 0.1));
    //float y = random (50, height - 50);
    //float y = height * 0.5 + (randomGaussian() * (height * 0.12));
    float y = height * 0.5 + (randomGaussian() * (height * 0.0125));
    //float a = atan2(x - width/2.0, y - height/2.0);
    float radius = abs(randomGaussian() * 45);
    //float radius = random(10, 100);
    int amountOfArcs = round(random(4, 9));
    //float rotation = random(0, 360);
    //float rotation = degrees(a + HALF_PI);
    float rotation = y > height*0.5 ? 0 : 180;
    circles[i] = new Circle(x, y, radius, amountOfArcs, rotation);
  }

  constructs = new Construct[NUMBEROFCONSTRUCTS];

  for (int i = 0; i < NUMBEROFCONSTRUCTS; i++) {
    PVector position = constructOrigins[i];
    constructs[i] = new Construct(position);
  }
}

void mousePressed() {
  reset();
}

void keyPressed() {
  if (key == 's') {
    saveFrame("captures/arc_compo_####.png");
  }
}
