Ambiente a;
void setup(){
size(500,500);
  a=new Ambiente();
};

void draw(){
 background(#FFFFFF);
 if(iniciado){
  a.mover();
  a.evaluar();
 };
  a.display();
};

PVector mousep;
boolean iniciado=false;

void mousePressed(){
 mousep=new PVector(mouseX,mouseY);
};

void mouseDragged(){
 rect(mousep.x,mousep.y,mouseX-mousep.x,mouseY-mousep.y);
};

void mouseReleased(){
 if(mode=='M'){
  a.addMuro(mousep,new PVector(mouseX,mouseY));
 };
};

void mouseClicked(){
 if(mode=='P'){
  a.crearPoblacion(new PVector(mouseX,mouseY),0.2,0.7,900,100);
 };
 if(mode=='O'){
  a.crearObjetivo(new PVector(mouseX,mouseY));
 };
};

void keyTyped(){
 mode=key;
  if(key=='s'){
   iniciado=true;
  };
};

char mode;