class Ambiente {

  Ambiente() {
    muros=new ArrayList<Muro>();
    p=new Poblacion();
    objetivo=new PVector();
  };

  public void moverPoblacion(final PVector spawn, final float pM, final float pR, final int lifeTime, final int nI) {
    p=new Poblacion(spawn, pM, pR, lifeTime, nI);
  };


  public void crearMuro(final PVector A, final PVector B) {
    muros.add(new Muro(A, B));
  };

  public void moverObjetivo(final PVector objetivo) {
    this.objetivo=objetivo;
  };

  public void mover() {
    coliciones();
    p.move();
  };

  public void coliciones() {
    for (Celula c : p.celulas) {
      for (Muro m : muros) {
        c.colicion(m);
        c.colicion(objetivo);
      };
    };
  };

  public void evaluar() {
    if (p.poblacionMuerta()) {
      p.funcionDeAdaptacion(objetivo);
      p.reproducir();
    };
  };

  public void display() {
    for (Muro m : muros) {
      m.display();
    };

    pushStyle();
    fill(OCOLOR);
    ellipse(objetivo.x, objetivo.y, OSIZE, OSIZE);
    popStyle();

    p.display();
  };

  private Poblacion p;
  private ArrayList<Muro> muros;
  private PVector objetivo;

  public static final float OSIZE=10;
  public static final color OCOLOR=#0503FF;
};