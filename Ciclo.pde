
class Ciclo
{
  float[] VALORES; // valores {A,B,C,Vueltas}
  float[][] MODIFICADORES; // modificadores

  Ciclo(float[] valores, float[][] modificadores)
  {
    VALORES = valores;
    MODIFICADORES = modificadores;
  }

  void unCiclo(float[] valores) // dibuja un ciclo
  {
    beginShape();
    for (float x = 0; x <= width; x += width / valores[3])
    {
      float R = valores[0] + valores[1] * cos(x * valores[2]);
      float y = R * sin(x);
      curveVertex(x, y + VALORES[4]);
    }
    endShape();
  }

  void actualizar(int llave) // aplica los modificadores a los valores
  {
    this.VALORES[0] += this.MODIFICADORES[llave][0];
    this.VALORES[1] += this.MODIFICADORES[llave][1];
    this.VALORES[2] += this.MODIFICADORES[llave][2];
    this.VALORES[4] += this.MODIFICADORES[llave][4];
    //this.modificaModificadores(llave, 1);
  }

  //void modificaModificadores(int llave, int llaveValor) // aplica el porcentaje de modificacion
  //{
  //  float porc = this.MODIFICADORES[llave][4];
  //  this.MODIFICADORES[llave][llaveValor] = this.MODIFICADORES[llave][llaveValor] * porc;
  //}

  void dibujar() // dibuja el coso
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

  String nombreArchivo ()
  {
    String nombre = year() + "" +
      nf(month(), 2) + "" +
      nf(day(), 2) + "_" +
      nf(hour(), 2) + "" +
      nf(minute(), 2) + "" +
      nf(second(), 2) + "_vals_" +
      join(nf(this.VALORES), "_") + "_mods_";
      
    for (int i = 0; i < this.MODIFICADORES.length; i++)
    {
      if (this.MODIFICADORES[i][3] == 0) break;
      nombre = nombre + join(nf(this.MODIFICADORES[i]), "_");
      nombre = nombre + " -" + i + "- ";
    }
    return nombre + ".svg";
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
