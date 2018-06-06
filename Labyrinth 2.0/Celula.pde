class Celula {

  Celula(final Celula padre, final Celula madre, final float pMutacion, final PVector spawn) {
    pos=new PVector(spawn.x, spawn.y);
    int lifeTime=padre.ADN.size();
       ADN=new FloatList();
    int corte=(int)random(0, lifeTime);
    for (int locus=0; locus<lifeTime; locus++) {
      float gen;
      if (locus<corte) {
        gen=padre.ADN.get(locus);
      } else {
        gen=madre.ADN.get(locus);
      };
      ADN.append(mutarGen(gen, pMutacion));
    };
    iGen=0;
    viva=true;
  };
 
  
  public void funcionDeCopia(){};

  public float mutarGen(final Float gen, final float pMutacion) {
    float mutacion=gen;
    if (random(0, 1)<=pMutacion) {
      mutacion=random(0, 2*PI);
    };
    return mutacion;
  };

  Celula(final float x, final float y, final int lifeTime) {
    pos=new PVector(x, y);
    generarDNA(lifeTime);
    iGen=0;
    viva=true;
  };

  public void move() {
    if (iGen==ADN.size()) {
       viva=false;
    };
    if (viva) {
      float a=ADN.get(iGen);
      pos.add(new PVector(SPEED*cos(a), SPEED*sin(a)));
    };
    iGen++;
  };

  public void adaptacion(final int m, final int M, final int a, final int b, final int d) {
    puntuacion=(((m-M)*(d-b))/(b-a))+m;
    puntuacion*=mult;
    if (iGen<ADN.size()) {
      puntuacion-=50;
    };
    if (d<=(Ambiente.OSIZE/2)) {
      puntuacion*=100;
    };
  };

  public void display() {
    pushStyle();
    if (viva) {
      fill(VIVA);
    } else {
      fill(MUERTA);
    };
    ellipse(pos.x, pos.y, SIZE, SIZE);
    popStyle();
  };

  public void generarDNA(final int lifeTime) {
    ADN=new FloatList();
    for (int i=0; i<lifeTime; i++) {
      ADN.append(random(0, 2*PI));
    };
  };

  public void colicion(final Muro m) {
    if (abs(pos.x-m.pos.x)<=(m.ancho/2) && abs(pos.y-m.pos.y)<=(m.alto/2)) {
      viva=false;
    };
  };
  
  public void colicion(final PVector objetivo){
    if(pos.dist(objetivo)<=Ambiente.OSIZE){
     mult*=20;
    };
  };

  public int distancia(final PVector objetivo) {
    return (int)pos.dist(objetivo);
  };

  private PVector pos;
  private FloatList ADN;
  private int iGen;
  private int mult=1;
 
 
  private boolean viva;

  public static final color MUERTA=#FF0000;
  public static final color VIVA=#FFFFFF;

  public static final float SPEED=3;
  public static final float SIZE=3;

  //------
  private int puntuacion;
};