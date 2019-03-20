float time = 0 ;
int scale = 200 ;
int cols, rows ;
boolean oddFlip = false ;
boolean fillTile = true ;
int totalSides = 16 ;
float polyDelta ; 
PolyTile3 pt ;
boolean paused = false ;
boolean record = false ;

void setup()
{
  size(800, 800) ;
  cols = width / scale + 2 ;
  rows = height / scale + 2 ;
}

void draw()
{
  if (!paused)
  {
    polyDelta = sin(time*0.5);
  
    translate(width/2, height/2) ;
    colorMode(HSB) ;
    background(map(sin(time), -1, 1, 0, 125), 255, 255);
    for (int row=0; row<rows; row++)
    {
      for (int col=0; col<cols; col++)
      {       
        if (totalSides%6==0) pt = new PolyTile3(hexTile(row,col), totalSides, polyDelta, scale*sin(time)*1.5, scale*1*0.88, 0) ;
        else  pt = new PolyTile3(new PVector(col*scale-width/2-scale, row*scale-height/2-scale), totalSides, polyDelta, scale/4*sin(time)*3, scale/2, 0) ;

        pt.draw() ;
        //pt.drawBoundary() ;
      }
    }
    time += 0.01 ;
    if (record) saveFrame("Saved Frames/frame###.png");
  }
  
}

/**
* Calculates the position of a hexagon at a particular column and row,
* in order for the tiles to perfectly tesselate.
*/
PVector hexTile(int col, int row)
{
  float root3 = sqrt(3) ;
  float perp = scale * sin(PI/3) ;

  float x = col*root3*perp-width/2-scale ;
  float y = -width/2-scale;
  if (col%2==0) y += row*2*perp ;
  else y += row*2*perp+perp ;
  return new PVector(x,y) ;
}

void keyPressed() 
{

  if (key == ENTER)
  {
    record = !record ;
  }
  else if (key == TAB)
  {
    saveFrame("Saved Frames/frame###.png");
  }
}
