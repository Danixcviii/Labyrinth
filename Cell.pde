class Cell{
 
 Cell(final PVector position,final int lifeTime){
   this.position=position;
   this.setUpDNA(lifeTime);
    speed=DEF_SPEED;
    status=Status.ALIVE;
    mutationProbability=DEF_MUTATION_PROBABILITY;
 };
 
 
 public FloatList copyDNA(){
   FloatList newDNA=new FloatList();
    for(float gen:DNA){
     newDNA.append(mutate(gen));
    };
     return newDNA;
 };
 
 public float mutate(final float gen){
    Float mutateGen=gen;
   float probability=random(0,1);
    if(probability<=mutationProbability){
      mutateGen=random(0,2*PI);
    };
     return mutateGen;
 };
 
 public float readDNA(final int locus){
  Float gen=DNA.get(locus);
   return gen;
 };
 
 public void setUpDNA(final int chromosomeSize){
  DNA=new FloatList();
  //creacion del cromosoma y genes
  for(int locus=0;locus<chromosomeSize;locus++){
   DNA.append(random(0,2*PI));
  };
 };
 
 public void move(final int locus){
  if(status==Status.ALIVE){
    float angle=readDNA(locus);
    float V_x=speed*cos(angle); //Velocity x
    float V_y=speed*sin(angle); //Velocity y
    position.add(new PVector(V_x,V_y));
  };
 };
 
 public void display(){
  pushStyle();
   if(status==Status.DEAD){
     color=DEATH_COLOR;
   };
   fill(color);
   ellipse(position.x,position.y,size,size);
  popStyle();
 };
 
 
 
 
 private FloatList DNA; 
 private PVector position;
 private float size;
 private color color;
 private float speed;
 private Status status;
 private float mutationProbability; //have to has values between 0 and 1.
 
 
 public static final float DEF_MUTATION_PROBABILITY=0.1;
 public static final color LIVE_COLOR=#FFFFFF;
 public static final color DEATH_COLOR=0;
 public static final float DEF_SIZE=5;
 public static final float DEF_SPEED=2;
};
//TODO: ask about, how is the use of State and Status
enum Status{
 ALIVE,DEAD
};
