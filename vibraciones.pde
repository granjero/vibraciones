import processing.svg.*;

int vueltas;
float[] valores = new float[4];
float[][] modificadores = new float[10][4];
boolean dibujar;

Ciclo ciclo;

void setup()
{
  size(1000, 1000);
  noFill();
  frameRate(1);
  //noLoop();
}

void draw()
{
  valores[0] = 93;                  // A
  valores[1] = 42.7;                // B
  valores[2] = 28.394;              // C
  valores[3] = TWO_PI / 51.83;      // ptos

  modificadores[0][0] = 3.3;        // modA
  modificadores[0][1] = -0.435;     // modB
  modificadores[0][2] = 0.01950;    // modC
  modificadores[0][3] = 10;         // Vueltas

  modificadores[1][0] = 3.3;        // modA
  modificadores[1][1] = -0.435;     // modB
  modificadores[1][2] = 0.01950;    // modC
  modificadores[1][3] = 10;         // Vueltas

  modificadores[2][0] = 3.3;        // modA
  modificadores[2][1] = -0.435;     // modB
  modificadores[2][2] = 0.01950;    // modC
  modificadores[2][3] = 10;         // Vueltas

  modificadores[3][0] = 3.3;        // modA
  modificadores[3][1] = -0.435;     // modB
  modificadores[3][2] = 0.01950;    // modC
  modificadores[3][3] = 10;         // Vueltas

  if (dibujar)
  {
    background(255);
    String filename = year() + "" + nf(month(), 2) + "" + nf(day(), 2) + "_" + millis() +".svg";
    beginRecord(SVG, filename);
  }

  background(255);
  translate(height / 2, width / 2);

  beginShape();
  ciclo = new Ciclo(valores, modificadores);
  ciclo.dibujar();
  endShape();

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
