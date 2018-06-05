class Poblacion{

  Poblacion(){
   celulas=new ArrayList<Celula>();
   spawn=new PVector();
  };
  
  Poblacion(final PVector spawn,final float pM,final float pR,final int lifeTime,final int nC){
   celulas=new ArrayList<Celula>();
    for(int i=0;i<nC;i++){
      celulas.add(new Celula(spawn.x,spawn.y,lifeTime));
    };
    
    this.spawn=spawn;
    this.pM=pM;
    this.pR=pR;
    
  };
  
 public boolean poblacionMuerta(){
  for(Celula c:celulas){
   if(c.estado==Estado.VIVA){
    return false;
   };
  };
   return true;
 };
  
 public void funcionDeAdaptacion(final PVector objetivo){
   distancias=new IntList();
     int j=0;
    for(Celula c:celulas){
     distancias.append(c.distancia(objetivo));
       j++;
    };
     
    int m=15;
    int M=100;
    int a=distancias.min();
    int b=distancias.max();
    
    int i=0;
    for(Celula c:celulas){
      c.adaptacion(m,M,a,b,distancias.get(i));
       i++;
       
    };
   
 };
  
  public void reproducir(){
     int pos=0;
     IntList caja=new IntList();
     ArrayList<Celula> nuevaGeneracion=new ArrayList<Celula>();
   for(Celula c:celulas){
     for(int j=0;j<c.adaptacion;j++){
      caja.append(pos);
     };
     pos++;
   };
   
  for(Celula c:celulas){
   float pRA=random(0,1);
    if(pRA<=pR){
    int p=caja.get((int)random(0,caja.size()));
     
     int m=caja.get((int)random(0,caja.size()));
    
    nuevaGeneracion.add(new Celula(celulas.get(p),celulas.get(m),spawn.x,spawn.y));
    }else{
    nuevaGeneracion.add(new Celula(c,spawn.x,spawn.y));
    };
  };
   for(Celula c:nuevaGeneracion){
    c.mutar(pM);
   };
   
   celulas=nuevaGeneracion;
    generacion++;
  };
  
  public void move(){
   for(Celula c:celulas){
    c.move();
   };
  };
  
  public void display(){
    
    println(generacion);
    
    pushStyle();
      fill(SCOLOR);
     ellipse(spawn.x,spawn.y,SSIZE,SSIZE);
    popStyle();
     for(Celula c:celulas){
      c.display();
     };
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