class PolyTile
{
  PVector center;
  int sides; 
  float R; 
  float r;
  PVector[] points ;
  float spin ;
  float delta = 0 ;

  PolyTile(PVector center, int sides, float delta, float R, float r, float spin)
  {
    this.center = center ;
    this.sides = sides ;
    this.R = R ;
    this.r = r ;
    this.points = new PVector[sides*2+1] ;
    this.spin = spin ;
    this.delta = delta ;
    this.calculatePoints() ;
  }

  float Radius(int n)
  {
    if (n%2==0) return this.R ;
    else return this.r ;
  }

  private void calculatePoints() 
  {
    float dTheta = TAU / (sides*2);
    float theta = 0;
   // float pRad = R ;
    for (int n = 0; n < sides*2+1; n++)
    {
      float rad = Radius(n);
      float x = center.x + Radius(n) * cos(theta+spin) ;
      float y = center.y + Radius(n) * sin(theta+spin) ;
     // if (rad == pRad) this.points[n] = new PVector(x, y, 0) ;
     /* else*/ this.points[n] = new PVector(x, y, 1) ;
      theta += dTheta ;
     // pRad = rad ;
    }
  }

  void draw()
  {
    for (int i=0; i < this.points.length-1; i++)
    {
      stroke(255) ;
     // if (this.points[i].z == 0)
      line(this.points[i].x, this.points[i].y, this.points[i+1].x, this.points[i+1].y) ;
    }
  }
}
