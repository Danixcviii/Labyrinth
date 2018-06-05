class Celula{
 
  Celula(final float x,final float y,final int lifeTime){
   pos=new PVector(x,y);
   generarDNA(lifeTime);
   gen=0;
   estado=Estado.VIVA;
  };
  
  Celula(final Celula c,final float x,final float y){
    pos=new PVector(x,y);
     int copia=(int)random(2);
     if(copia==0){
      generarDNA(c.DNA.size());
     }else{
      DNA=c.DNA;
     };
     gen=0;
     estado=Estado.VIVA;
  };
  
  Celula(final Celula p,final Celula m,final float x,final float y){
    pos=new PVector(x,y);
    DNA=new FloatList();
    
    int split=(int)random(0,p.DNA.size());
    int cadena=(int)random(2);
    for(int i=0;i<split;i++){
      if(cadena==0){
       DNA.append(p.DNA.get(i));
      }else if(cadena==1){
       DNA.append(m.DNA.get(i));
      };
    };
    for(int j=split;j<m.DNA.size();j++){
      if(cadena==0){
       DNA.append(m.DNA.get(j));
      }else if(cadena==1){
       DNA.append(p.DNA.get(j));
      };
    };
    
    gen=0;
    estado=Estado.VIVA;
  };
  
  public void mutar(final float pM){
    float pMA=random(0,1);
     if(pMA>=pM){
       int locus=(int)random(0,DNA.size());
       float gen=random(0,2*PI);
        DNA.set(locus,gen);
     };
  };
  
  public void move(){
   if(gen==DNA.size()){
    estado=Estado.MUERTA;
   };
    if(estado==Estado.VIVA){
     float a=DNA.get(gen);
     pos.add(new PVector(SPEED*cos(a),SPEED*sin(a)));
   };
    gen++;
  };
  
  public void adaptacion(final int m,final int M,final int a,final int b,final int d){
   adaptacion=(((m-M)*(d-b))/(b-a))+m;
    if(gen<DNA.size()){
     adaptacion-=14;
    };
    if(d<=(Ambiente.OSIZE/2)){
     adaptacion*=100;
    };
  };
  
  public void display(){
    pushStyle();
  if(estado==Estado.VIVA){
    fill(VIVA);
   }else{
    fill(MUERTA);
   };
    ellipse(pos.x,pos.y,SIZE,SIZE);
    popStyle();
  };
  
  public void generarDNA(final int lifeTime){
   DNA=new FloatList();
    for(int i=0;i<lifeTime;i++){
     DNA.append(random(0,2*PI));
    };
  };
  
  public void colicion(final Muro m){
   if(abs(pos.x-m.pos.x)<=(m.ancho/2) && abs(pos.y-m.pos.y)<=(m.alto/2)){
    estado=Estado.MUERTA;
   };
  };
  
  public int distancia(final PVector objetivo){
   return (int)pos.dist(objetivo);
  };
  
  private PVector pos;
  private FloatList DNA;
  private int gen;
  private Estado estado;
  
  public static final color MUERTA=#FF0000;
  public static final color VIVA=#FFFFFF;
  
  public static final float SPEED=3;
  public static final float SIZE=3;
  
  //------
  private int adaptacion;
  
  
  
  
};

enum Estado{
 VIVA,MUERTA;
};