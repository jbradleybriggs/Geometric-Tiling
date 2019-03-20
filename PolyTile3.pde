class PolyTile3
{
  PVector center;
  int sides; 
  float R; 
  float r;
  PVector[] points ;
  float spin ;
  float delta = 0 ;

  PolyTile3(PVector center, int sides, float delta, float R, float r, float spin)
  {
    this.center = center ;
    this.sides = sides ;
    this.R = R ;
    this.r = r ;
    this.points = new PVector[sides*3+1] ;
    this.spin = spin ;
    this.delta = delta ;
    this.calculatePoints() ;
  }

  private void calculatePoints() 
  {
    float theta = TAU / (2 * sides) ;
    float dTheta = -delta+spin ;
    for (int n = 0; n < sides*3+1; n++)
    {
      float x, y, z ;
      if (n%3==0)
      {
        dTheta+= 2*delta ;
        z = R ;
      } else if ((n-1)%3==0)
      {
        dTheta+= theta - delta ;
        z = r ;
      } else /*if ((n+1)%3==0)*/
      {
        dTheta+= theta - delta ;
        z = R ;
      }
      x = center.x + z * cos(dTheta) ;
      y = center.y + z * sin(dTheta) ;
      this.points[n] = new PVector(x, y, z) ;
    }
  }

  void draw()
  {
    if (fillTile)
    {
      noStroke() ;
      fill(0, 0, 0, 90) ;
    } else
    {
      noFill() ;
      stroke(0) ;
    }
    beginShape() ;
    for (int i=0; i < this.points.length; i++)
    {
      vertex(this.points[i].x, this.points[i].y) ;
    }
    endShape(CLOSE) ;
  }
  
  void drawBoundary()
  {
    float dTheta = spin ;
    float theta = TAU / sides ;
    stroke(0) ;
    noFill() ;
    beginShape() ;
    for (int i=0; i< sides; i++)
    {
        float x = center.x + r * cos(dTheta) ;
        float y = center.y + r * sin(dTheta) ;
        dTheta += theta ;
        vertex(x, y) ;
    }
    endShape(CLOSE) ;
  }
}
