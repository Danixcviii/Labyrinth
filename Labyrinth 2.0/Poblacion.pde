class Poblacion {

  Poblacion() {
    celulas=new ArrayList<Celula>();
    spawn=new PVector();
  };

  Poblacion(final PVector spawn, final float pM, final float pR, final int lifeTime, final int nC) {
    celulas=new ArrayList<Celula>();
    for (int i=0; i<nC; i++) {
      celulas.add(new Celula(spawn.x, spawn.y, lifeTime));
    };

    this.spawn=spawn;
    this.pM=pM;
    this.pR=pR;
  };

  public boolean poblacionMuerta() {
    for (Celula c : celulas) {
      if (c.viva) {
        return false;
      };
    };
    return true;
  };

  public void funcionDeAdaptacion(final PVector objetivo) {
    distancias=new IntList();
    for (Celula c : celulas) {
      distancias.append(c.distancia(objetivo));
    };

    int m=51;
    int M=150;
    int a=distancias.min();
    int b=distancias.max();

    int i=0;
    for (Celula c : celulas) {
      c.adaptacion(m, M, a, b, distancias.get(i));
      i++;
    };
  };

  public void reproducir() {
    IntList loveBox=new IntList();
    ArrayList<Celula> nuevaGeneracion=new ArrayList<Celula>();
    for (Celula c : celulas) {
      for (int j=0; j<c.puntuacion; j++) {
        loveBox.append(celulas.indexOf(c));
      };
    };
    
    for (int i=0; i<celulas.size()/2; i++) {
      int iPadre=loveBox.get((int)random(0, loveBox.size()));
      int iMadre=loveBox.get((int)random(0, loveBox.size()));
      if(random(0,1)<=pR){
      nuevaGeneracion.add(new Celula(celulas.get(iPadre), celulas.get(iMadre), pM, spawn));
      nuevaGeneracion.add(new Celula(celulas.get(iMadre), celulas.get(iPadre), pM, spawn));
      }else if(random(0,1)<=0.1){
      nuevaGeneracion.add(new Celula(spawn.x,spawn.y,celulas.get(iPadre).ADN.size()));
      nuevaGeneracion.add(new Celula(spawn.x,spawn.y,celulas.get(iPadre).ADN.size()));
      }else{
      nuevaGeneracion.add(new Celula(celulas.get(iPadre),celulas.get(iPadre),pM,spawn));
      nuevaGeneracion.add(new Celula(celulas.get(iMadre),celulas.get(iMadre),pM,spawn));
      };
    };

    celulas=nuevaGeneracion;
    generacion++;
  };

  public void move() {
    for (Celula c : celulas) {
      c.move();
    };
  };

  public void display() {
    pushStyle();
    fill(SCOLOR);
    ellipse(spawn.x, spawn.y, SSIZE, SSIZE);
    popStyle();
    for (Celula c : celulas) {
      c.display();
    };
    pushStyle();
    fill(#FF0000);
    text("Generacion:"+a.p.generacion +" ;  Numero de Individuos :"+ celulas.size(), 1, height-1);
    popStyle();
  };

  private float pM;
  private float pR;

  private PVector spawn;
  private ArrayList<Celula> celulas;

  private IntList distancias;
  private int generacion;

  public static final float SSIZE=10;
  public static final color SCOLOR=#FFF000;
};