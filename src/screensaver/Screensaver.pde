float xpos, ypos, strokeW, pointCount;

void setup() {
  size(displayWidth, displayHeight);
  fullScreen();
  xpos = random(width);
  ypos = random(height);
  background(random(200, 255));
}

void draw() {
  strokeW = random(2, 15);
  pointCount = random(10, 80);
  stroke(random(22), random(99), random(255));
  strokeWeight(strokeW);
  if (xpos < 0 || xpos> width || ypos < 0 || ypos > height) {
    xpos = random(width);
    ypos = random(height);
  }
  int rand = int(random(4));
  if(rand == 0) {
    moveRight(xpos,ypos,pointCount);
  } else if (rand==1) {
    moveUp(xpos,ypos,pointCount);
  } else if (rand==2) {
    moveDown(xpos,ypos,pointCount);
  } else {
    moveLeft(xpos,ypos,pointCount);
  }
  //moveDown(xpos, ypos, pointCount);
}
void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}
void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY-i;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY+i;
  }
}
