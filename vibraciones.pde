import processing.svg.*;

int vueltas;
float[] valores = new float[4];
float[] modificadores = new float[3];
boolean dibujar;

Ciclo ciclo;

void setup()
{
  size(1000, 1000);
  noFill();
  frameRate(1);
  noLoop();
}

void draw()
{
  valores[0] = 64;               // A
  valores[1] = 47.8;             // B
  valores[2] = 23.420;           // C
  valores[3] = TWO_PI / 53.90;   // ptos
  modificadores[0] = 2.2;        // modA
  modificadores[1] = -0.868;     // modB
  modificadores[2] = 0.02516;    // modC
  vueltas = 55;

  if (dibujar)
  {
    String filename = year() + "" + nf(month(), 2) + "" + nf(day(), 2) + "_" + millis() +".svg";
    beginRecord(SVG, filename);
  }

  background(255);
  translate(height / 2, width / 2);
  beginShape();
  stroke(0, 255, 0);

  print(valores[0] + " - ");
  print(valores[1] + " - ");
  println(valores[2]);

  ciclo = new Ciclo(valores, modificadores, vueltas);
  valores = ciclo.dibujar();
  endShape();
  beginShape();
  print(valores[0] + " - ");
  print(valores[1] + " - ");
  println(valores[2]);

  //-------
  //valores[0] = 64;               // A
  //valores[1] = 46.2;             // B
  //valores[2] = 23.420;           // C
  modificadores[0] = 5.8;        // modA
  modificadores[1] = -0.040;     // modB
  modificadores[2] = 0.02516;    // modC

  vueltas = 34;
  stroke(255, 0, 0);
  ciclo = new Ciclo(valores, modificadores, vueltas);
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

  float[] actualizar()
  {
    VALS[0] += MODS[0];
    VALS[1] += MODS[1];
    VALS[2] += MODS[2];
    return VALS;
  }

  float[] dibujar()
  {
    float[] valores = new float[2];
    for (int i = 0; i < VLTS; i++)
    {
      valores = this.actualizar();
      this.dibujaCiclo();
    }
    return valores;
  }
}

void mouseClicked()
{
  dibujar = true;
  println("click");
}
