import processing.svg.*;

int vueltas;
float[] valores = new float[6];
float[][] modificadores = new float[10][5];
boolean dibujar;

Ciclo ciclo;

void setup()
{
  size(800, 1000);
  noFill();
  frameRate(1);
  //noLoop();
}

void draw()
{
  valores[0] = 0;       // A
  valores[1] = 10.33;   // B
  valores[2] = 1.663;   // C
  valores[3] = 18.05;   // ptos
  valores[4] = -11;     // y

  modificadores[0][0] = 0.60;      // modA
  modificadores[0][1] = 0.058;     // modB
  modificadores[0][2] = 0.00115;   // modC
  modificadores[0][3] = 154;       // Vueltas
  modificadores[0][4] = 5.70;      // incrementa y

  /*
  modificadores[1][0] = 3.3;        // modA
   modificadores[1][1] = 1.150;     // modB
   modificadores[1][2] = -0.00250;  // modC
   modificadores[1][3] = 44;        // Vueltas
   modificadores[1][4] = 1.0264;    // incrementador
   
   modificadores[2][0] = 3.3;        // modA
   modificadores[2][1] = 1.150;     // modB
   modificadores[2][2] = -0.00250;    // modC
   modificadores[2][3] = 44;         // Vueltas
   modificadores[2][4] = 1.0264;       // incrementador
   
   modificadores[2][0] = 3.3;        // modA
   modificadores[2][1] = -0.435;     // modB
   modificadores[2][2] = 0.01950;    // modC
   modificadores[2][3] = 10;         // Vueltas
   
   modificadores[3][0] = 3.3;        // modA
   modificadores[3][1] = -0.435;     // modB
   modificadores[3][2] = 0.01950;    // modC
   modificadores[3][3] = 10;         // Vueltas
   */
  strokeWeight(1);
  if (dibujar)
  {
    background(255);
    beginRecord(SVG, ciclo.nombreArchivo());
  }

  background(255);
  translate(0, height / 50);

  //beginShape();
  ciclo = new Ciclo(valores, modificadores);
  ciclo.dibujar();
  //endShape();

  if (dibujar)
  {
    endRecord();
    dibujar = false;
  }
}

// ==========================================================================
// funciones extra
// ==========================================================================


void mouseClicked()
{
  dibujar = true;
  println("click");
}
