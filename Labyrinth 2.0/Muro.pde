class Muro {

  Muro(final PVector A, final PVector B) {
    pos=new PVector((A.x+B.x)/2, (A.y+B.y)/2);

    ancho=abs(B.x-A.x);
    alto=abs(B.y-A.y);
  };

  public void display() {
    rect(pos.x-(ancho/2), pos.y-(alto/2), ancho, alto);
  };

  private PVector pos;
  private float ancho;
  private float alto;
};