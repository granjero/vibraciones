int vueltas;

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

  // A, B, C, Puntos
  float[] valoresParaElCiclo = {107, 23.3, 25.143, (TWO_PI / 56.91)};
  // modA, modB, modC
  float[] modificadoresParaElCiclo = {4.0, -0.280, 0.01436};

  vueltas = 85;

  beginShape();

  ciclo = new Ciclo(valoresParaElCiclo, modificadoresParaElCiclo);

  for (int i = 0; i < vueltas; i++)
  {
    ciclo.dibujar();
    ciclo.actualizar();
  }

  endShape();
}

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
  float[] VALS;
  float[] MODS;
  int contador = 0;

  Ciclo(float[] valores, float[] modificadores)
  {
    VALS = valores;
    MODS = modificadores;
  }

  void dibujar()
  {
    contador = 0;
    for (float i = 0; i <= TWO_PI; i += VALS[3])
    {
      float R = VALS[0] + VALS[1] * cos(i * VALS[2]);
      float x = R * cos(i);
      float y = R * sin(i);
      curveVertex(x, y);
      //strokeWeight(5);
      //point(x, y);
      //strokeWeight(1);
      contador++;
    }
    println(contador);
  }

  void actualizar()
  {
    VALS[0] += MODS[0];
    VALS[1] += MODS[1];
    VALS[2] += MODS[2];
  }
}
