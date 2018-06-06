import javax.swing.*;


Ambiente a;
void setup() {
  size(500, 500);
  a=new Ambiente();
};

void draw() {
  background(#FFFFFF);
  if (iniciado) {
    a.mover();
    a.evaluar();
  };
  a.display();
};

PVector mousep;
boolean iniciado=false;

void mousePressed() {
  mousep=new PVector(mouseX, mouseY);
};

void mouseDragged() {
  rect(mousep.x, mousep.y, mouseX-mousep.x, mouseY-mousep.y);
};

void mouseReleased() {
  if (mode=='M') {
    a.crearMuro(mousep, new PVector(mouseX, mouseY));
  };
};

void mouseClicked() {
  if (mode=='P') {
    a.moverPoblacion(new PVector(mouseX, mouseY), 0.01, 0.5, 900, 100);
  };
  if (mode=='O') {
    a.moverObjetivo(new PVector(mouseX, mouseY));
  };
};

void keyTyped() {
  mode=key;
  if (key=='s') {
    iniciado=!iniciado;
  };
};

char mode;