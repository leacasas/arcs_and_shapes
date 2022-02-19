class Circle {
  
  float alpha = random(1) > 0.3 ? 45 : 80;

  private PVector _position;
  private float _radius, _rotation, _radialCut;
  private Arc[] _arcs;

  Circle(float x, float y, float radius, int arcAmount, float rotation)
  {
    _position = new PVector(x, y);
    _radius = radius;
    _rotation = rotation;
    _radialCut = radius * random(0.33, 0.9);

    _arcs = new Arc[arcAmount];

    for (int i = 0; i < arcAmount; i++) {

      float[] radiuses = new float[]{random(_radialCut, radius), random(_radialCut, radius)};

      //float arcSize = random(30, 360);
      float arcSize = 180;
      float arotation = rotation;
      Arc arc = new Arc(x, y, max(radiuses), min(radiuses), arcSize, arotation);
      arc.alpha = alpha;
      _arcs[i] = arc;
    }
  }
  
  void setAsBackground(color[] colors){
    colorMode(HSB, 100);
    color[] bgColors = new color[colors.length];
    for(int i = 0; i < colors.length; i++){
      float h = hue(colors[i]);
      float b = brightness(colors[i]);
      float s = saturation(colors[i]);
      bgColors[i] = color(h, s*0.5, b, 8);
    }
    
    for (Arc _arc : _arcs) {
      _arc.setColors(bgColors);
      _arc._innerRadius = _arc._outerRadius * 0.97;
      _arc._rotation = random(360);
      _arc._arc = radians(180 + random(-10, 10));
    }
     colorMode(RGB,255);
  }

  void draw()
  {
    for (Arc _arc : _arcs) {
      _arc.alpha = alpha;
      _arc.draw();
    }
  }
}
