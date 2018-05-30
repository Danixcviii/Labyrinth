class Cell{
 
 
 
 
 public setUpDNA(final int chainLength){
  DNA=new FloatList();
  //creacion del cromosoma y genes
  for(int locus=0;locus<chainLength;locus++){
   DNA.append(random(0,2*PI));
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
 private float angle;
 private Status status;
 
 public static final LIVE_COLOR=#FFFFFF;
 public static final DEATH_COLOR=0;
};
//TODO: ask about, how is the use of State and Status
enum Status{
 ALIVE,DEAD
};
