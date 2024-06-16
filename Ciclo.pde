
class Ciclo
{
  float[] VALORES; // valores {A,B,C,Vueltas}
  float[][] MODIFICADORES; // modificadores

  Ciclo(float[] valores, float[][] modificadores)
  {
    VALORES = valores;
    MODIFICADORES = modificadores;
  }

  void unCiclo(float[] valores)
  {
    for (float i = 0; i <= TWO_PI; i += valores[3])
    {
      // R = A + B * cos(C * i)
      float R = valores[0] + valores[1] * cos(i * valores[2]);
      float x = R * cos(i);
      float y = R * sin(i);
      curveVertex(x, y);
      //println("porcion ciclo " + i);
    }
  }

  void actualizar(int llave)
  {
    this.VALORES[0] += this.MODIFICADORES[llave][0];
    this.VALORES[1] += this.MODIFICADORES[llave][1];
    this.VALORES[2] += this.MODIFICADORES[llave][2];
  }

  void dibujar()
  {
    for (int i = 0; i < this.MODIFICADORES.length; i++)
    {
      for (int j = 0; j < this.MODIFICADORES[i][3]; j++)
      {        
        this.actualizar(i);
        this.unCiclo(this.VALORES);
      }
    }
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
}
