

class APunkt {
  float x, y;
  float h;
  float speedX, speedY;

  float abst;
  int band;
  float sound;
  


  APunkt() {
    x=width/2;
    y=height/2;
    h=rasterX*PI/rasterY;

    speedX = random(-5, 5);
    speedY = random(-5, 5);
  }


  void render() {
   
   // for (int i=1; i <= fftR.avgSize(); i+=fftR.avgSize()) {
    // band=int(map(x,0,width,1,fftR.avgSize()-1));
    sound = fftR.getBand(band);
   // }
    

    pushMatrix();
    translate(x, y);
    x+=speedX*(sound);
    y+=speedY*(sound);

    if (x<h) {
      speedX=-speedX;
    }
    if (x>width-3*h) {
      speedX=-speedX;
    }
    if (y<h/2) {
      speedY=-speedY;
    }
    if (y>displayHeight-5*h) {
      speedY=-speedY;
    }


    noFill();
    ellipse(200, 200, h, h);


    popMatrix();

    for (int i=0; i<anzahlX; i++) {
      for (int j=0; j<anzahlY; j++) {

        if (dist(x, y, myPunkte[i][j].x, myPunkte[i][j].y)<500) {
          
          //quad(x, y, (myPunkte[i][j].x), y, myPunkte[i][j].x, myPunkte[i][j].y, (x), myPunkte[i][j].y);
          noStroke();
        }
        if (dist(x, y, myPunkte[i][j].x, myPunkte[i][j].y)<200) {
         stroke(254, map(dist(x, y, myPunkte[i][j].x, myPunkte[i][j].y), 300, h, h, 255));
          strokeWeight(0.1*sound/1);
         line(x, y, (myPunkte[i][j].x), myPunkte[i][j].y);
          noStroke();
          ellipse(myPunkte[i][j].x, myPunkte[i][j].y, myPunkte[i][j].x, myPunkte[i][j].y);
          stroke(255);
          smooth();
        }
      }
    }
  }
}