import ddf.minim.*;
import ddf.minim.analysis.*;

// Objekte erstellen
Minim minim;
AudioInput input;
FFT fftR, fftL;


APunkt [][] myPunkte;

int anzahlX = 20;
int anzahlY = 6;

int rasterX=10;
int rasterY=10;


void setup() {
  size(1920, 1080);
  noStroke();

  minim = new Minim(this);

  input = minim.getLineIn();  //microInput

  // FFT-Instanz für die Spektrumsanalyse der beiden Kanäle
  fftR = new FFT (input.bufferSize (), input.sampleRate ());
  fftL = new FFT (input.bufferSize (), input.sampleRate ());
  fftR.logAverages(10, 10);
  fftL.logAverages(10, 10);


  myPunkte = new APunkt [anzahlX][anzahlY];
  for (int i=0; i<anzahlX; i++) {
    for (int j=0; j<anzahlY; j++) {
      myPunkte[i][j]= new APunkt();
      myPunkte[i][j].x=random(50, width-50);
      myPunkte[i][j].y=random(50, height-50);
      myPunkte[i][j].band=int(random( 1, fftR.avgSize()-1));
      // myPunkte[i][j].x=rasterX*(i+1);
      // myPunkte[i][j].y=rasterY*(j+1);
    }
  }
}

void draw() {
  background(0);

  fftR.forward(input.right);
  fftL.forward(input.left);

  for (int i=0; i<anzahlX; i++) {
    for (int j=0; j<anzahlY; j++) {
      myPunkte[i][j].render();
    }
  }
}

void stop()
{
  // Player in schließen
  input.close();
  // Minim Object stoppen
  minim.stop();

  super.stop();
}