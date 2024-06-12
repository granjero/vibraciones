import processing.svg.*;

int vueltas;
float[] valoresParaElCiclo = new float[4];
float[] modificadoresParaElCiclo = new float[3];
boolean dibujar;

Ciclo ciclo;

void setup()
{
  size(1000, 1000);
  noFill();
  //noLoop();
}

void draw()
{
  valoresParaElCiclo[0] = 64;              // A
  valoresParaElCiclo[1] = 46.2;             // B
  valoresParaElCiclo[2] = 23.420;           // C
  valoresParaElCiclo[3] = TWO_PI / 53.90;   // ptos
  modificadoresParaElCiclo[0] = 6.8;        // modA
  modificadoresParaElCiclo[1] = -0.837;     // modB
  modificadoresParaElCiclo[2] = 0.02516;    // modC
  vueltas = 55;

  if (dibujar)
  {
    String filename = year() + "" + nf(month(), 2) + "" + nf(day(), 2) + "_" + millis() +".svg";
    beginRecord(SVG, filename);
  }

  background(255);
  translate(height / 2, width / 2);
  beginShape();

  ciclo = new Ciclo(valoresParaElCiclo, modificadoresParaElCiclo, vueltas);
  ciclo.dibujar();
  
  //-------
  
  modificadoresParaElCiclo[0] = 6.8;        // modA
  modificadoresParaElCiclo[1] = -0.040;     // modB
  vueltas = 15;
  
  ciclo = new Ciclo(valoresParaElCiclo, modificadoresParaElCiclo, vueltas);
  ciclo.dibujar();
  
  endShape();
  
  if (dibujar)
  {
    endRecord();
    dibujar = false;
  }
}

// ==========================================================================
// ==========================================================================
// ==========================================================================

void drawGrid(int gridSize) {
  stroke(200);
  strokeWeight(1);
  for (int x = 0; x <= width; x += gridSize) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += gridSize) {
    line(0, y, width, y);
  }
  // punto central
  strokeWeight(11);
  stroke(200, 0, 0);
  point (height / 2, width / 2);
  stroke(0);
  strokeWeight(1);
}

class Ciclo
{
  float[] VALS; // valores
  float[] MODS; // modificadores
  int VLTS;
  // int contador = 0

  Ciclo(float[] valores, float[] modificadores, int vueltas)
  {
    VALS = valores;
    MODS = modificadores;
    VLTS = vueltas;
  }

  void dibujaCiclo()
  {
    for (float i = 0; i <= TWO_PI; i += VALS[3])
    {
      // R = A + B * cos(C * i)
      float R = VALS[0] + VALS[1] * cos(i * VALS[2]);
      float x = R * cos(i);
      float y = R * sin(i);
      curveVertex(x, y);
      //strokeWeight(5);
      //point(x, y);
      //strokeWeight(1);
    }
  }

  void actualizar()
  {
    VALS[0] += MODS[0];
    VALS[1] += MODS[1];
    VALS[2] += MODS[2];
  }

  void dibujar()
  {
    for (int i = 0; i < VLTS; i++)
    {
      ciclo.actualizar();
      ciclo.dibujaCiclo();
    }
  }
}

void mouseClicked()
{
  dibujar = true;
  println("click");
}
