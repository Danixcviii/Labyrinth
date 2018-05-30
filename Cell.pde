class Cell{
 
 Cell(final PVector position,final int lifeTime){
   this.position=position;
   this.setUpDNA(lifeTime);
    speed=DEF_SPEED;
    status=ALIVE;
 };
 
 
 
 public setUpDNA(final int chromosomeSize){
  DNA=new FloatList();
  //creacion del cromosoma y genes
  for(int locus=0;locus<chainLength;locus++){
   DNA.append(random(0,2*PI));
  };
 };
 
 public void move(final int currentGen){
  if(status==ALIVE){
    float angle=DNA.get(currentGen);
    float V_x=speed*cos(angle); //Velocity x
    float V_Y=speed*sin(angle); //Velocity y
    position.add(new PVector(V_x,V_y));
  };
 };
 
 public void display(){
  pushStyle();
   if(status==DEAD){
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
 
 public static final color LIVE_COLOR=#FFFFFF;
 public static final color DEATH_COLOR=0;
 public static final float DEF_SIZE=5;
 public static final float DEF_SPEED;
};
//TODO: ask about, how is the use of State and Status
enum Status{
 ALIVE,DEAD
};
