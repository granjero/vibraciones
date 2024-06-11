int vueltas;
float[] valoresParaElCiclo = new float[4];
float[] modificadoresParaElCiclo = new float[3];
Ciclo ciclo;

void setup()
{
  size(1000, 1000);
  noFill();
  //noLoop();
}

void draw()
{
  background(255);
  //drawGrid(10);

  translate(height / 2, width / 2);

  valoresParaElCiclo[0] = 163;              // A
  valoresParaElCiclo[1] = 0.0;             // B
  valoresParaElCiclo[2] = 24.634;           // C            
  valoresParaElCiclo[3] = TWO_PI / 65.50;   // ptos

  modificadoresParaElCiclo[0] = 2.6;        // modA
  modificadoresParaElCiclo[1] = 1.068;     // modB
  modificadoresParaElCiclo[2] = 0.01179;    // modC   

  vueltas = 57;

  beginShape();

  ciclo = new Ciclo(valoresParaElCiclo, modificadoresParaElCiclo, vueltas);

  ciclo.dibujar();
 
  modificadoresParaElCiclo[1] = -1.067;     // modB

  ciclo.dibujar();

  endShape();
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
      ciclo.dibujaCiclo();
      ciclo.actualizar();
    }
  }
}
