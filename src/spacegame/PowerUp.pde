class PowerUp {
  int x, y, diam, speed;
  char type;
  color c1;

  PowerUp () {
    x = int(random(width));
    y = int(random(-100, -1000));
    diam = 60;
    speed = 8;
    c1 = color(0,100,0);
    int rand = int(random(3));
    if(rand==0) {
      type = 'H';
    } else if (rand ==1){
      type = 'A';
    } else {
      type = 'T';
    }
  }
  
  void display() {
    fill(c1);
    ellipse(x,y,diam,diam);
    textAlign(CENTER);
    textSize(18);
    fill(255);
    text(type, x,y);
  }
  
  void move() {
      y+=speed;
  }
  boolean reachedBottom() {
    if(y > height + 100) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(SpaceShip ship) {
    float d = dist(x,y,ship.x,ship.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
    
  }
}
