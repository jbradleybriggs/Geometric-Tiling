class PolyTile2
{
  PVector center;
  int sides; 
  float R; 
  float r;
  PVector[] points ;
  float spin ;
  float delta = 0 ;

  PolyTile2(PVector center, int sides, float delta, float R, float r, float spin)
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

  float Radius(int n)
  {
    for (int k=1; k<= sides+1; k++)
    {
      int num = 3*k - 2 ;
      if (n == num) return this.r ;
    }
    return this.R ;
  }

  private void calculatePoints() 
  {
    float dTheta = TAU / (sides*3);
    float theta = -dTheta;
    byte dir = 1 ;

    for (int n = 0; n < sides*3+1; n++)
    {
      float rad = Radius(n) ;
      float x, y ;
      if (rad == this.R)
      {
        x = center.x + rad * cos(theta+spin+delta*dir) ;
        y = center.y + rad * sin(theta+spin+delta*dir) ;
        dir *= -1 ;
      } else
      {
        x = center.x + rad * cos(theta+spin) ;
        y = center.y + rad * sin(theta+spin) ;
      }
      this.points[n] = new PVector(x, y) ;
      theta += dTheta ;
    }
  }

  void draw()
  {
    noStroke() ;
    fill(0) ;
    beginShape() ;
    for (int i=0; i < this.points.length; i++)
    {
      vertex(this.points[i].x, this.points[i].y) ;
    }
    endShape(CLOSE) ;
  }
}
