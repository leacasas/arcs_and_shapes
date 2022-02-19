class Arc //<>//
{
  private int detail = 48;
  private float alpha = random(1) > 0.75 ? 55 : 100;
  private float increment = 1.0 / float(detail - 1);

  private PVector _position;
  private float _outerRadius, _innerRadius;
  private float _arc, _rotation;
  private color[] colors;

  private PVector[] _vertices;

  Arc(float x, float y, float outerRadius, float innerRadius, float arc, float rotation)
  {
    _position = new PVector(x, y);
    _outerRadius = outerRadius;
    _innerRadius = innerRadius;
    _arc = radians(arc);
    _rotation = radians(rotation);

    _vertices = new PVector[detail];
    float angleIncrement = TWO_PI / float(detail - 1);
    for (int i = 0; i < detail; ++i)
      _vertices[i] = PVector.fromAngle(i * angleIncrement);

    setColors(PALETTE);
    //setColorsByNoise(PALETTE);
  }

  void setColors(color[] choosenColors) {    
    int amount = round(random(2, 4));

    colors = new color[amount];

    int limit = choosenColors.length;

    for (int i = 0; i < amount; i++)
      colors[i] = choosenColors[floor(random(limit))];
  }

  void setColorsByNoise(color[] choosenColors) {
    int limit = choosenColors.length;
    
    int amount = round(random(2, limit));

    colors = new color[amount];    

    for (int i = 0; i < amount; i++) {
      float n = noise(_position.x, _position.y, i) * limit;
      println(floor(n));
      colors[i] = choosenColors[floor(n)];
    }
  }

  void draw()
  {      
    pushMatrix();
    translate(_position.x, _position.y); 
    rotate(_rotation);

    beginShape(QUADS);
    noStroke();

    for (int i = 0, j; i < detail - 1; ++i) {
      // Draw edge n.
      float iprc = i * increment;
      float itheta = iprc * _arc;
      _vertices[i].set(cos(itheta), sin(itheta));
      fill(getColor(iprc, colors), alpha);
      vertex(_vertices[i].x * _innerRadius, _vertices[i].y * _innerRadius);
      vertex(_vertices[i].x * _outerRadius, _vertices[i].y * _outerRadius);

      // Draw edge n + 1.
      j = i + 1;
      float jprc = j * increment;
      float jtheta = jprc * _arc;
      _vertices[j].set(cos(jtheta), sin(jtheta));
      fill(getColor(jprc, colors), alpha);
      vertex( _vertices[j].x * _outerRadius, _vertices[j].y * _outerRadius);
      vertex( _vertices[j].x * _innerRadius, _vertices[j].y * _innerRadius);
    }

    endShape();
    popMatrix();
  }
}
