float dZoom;
float zoom = 1;
int scroll;
void setup() {
  size(1500,1000,P3D);
  rectMode(CENTER);
  noFill();
}

void draw() {
  background(0);
  translate(750,500,0);
  // 3D Manuever
  int y;
  if (mouseY > 0) {
    y = mouseY;
  } else {
    y = 300;
  }
  rotateX(-(y-500)*PI*1/1500);
  rotateY((mouseX-750)*PI*1/1500);
  
  //Zooming
  scale(zoom);
  
  orb(810, 0);
}

void orb(int scale, int col) {
  int newCol;
  if (col == 0) {
    stroke(256,0,0);
    newCol = 1;
  } else if (col == 1) {
    stroke(0,256,0);
    newCol = 2;
  } else {
    stroke(0,0,256);
    newCol = 0;
  }
  sphere(scale);
  if (scale >= 30) {
    orb(scale/3, newCol);
    for (int i = -2*scale/3; i <= 2*scale/3; i+=4*scale/3) {
      pushMatrix();
        translate(i,0,0);
        orb(scale/3, newCol);
      popMatrix();
    }
    for (int i = -2*scale/3; i <= 2*scale/3; i+=4*scale/3) {
      pushMatrix();
        translate(0,i,0);
        orb(scale/3, newCol);
      popMatrix();
    }
  }
}

//Zooming
void mouseWheel(MouseEvent event) {
  scroll = event.getCount();
  if (zoom > 15) {
    dZoom = 2;
  } else if (zoom > 5) {
    dZoom = 1;
  } else {
    dZoom = 0.5;
  }
  
  if (scroll == -1) {
    zoom+=dZoom;
  } else if (scroll == 1) {
    zoom-=dZoom;
  }
  if(zoom < 1) {
    zoom = 30;
  }
  if (zoom > 30) {
    zoom = 1;
  }
  System.out.println(zoom);
}
