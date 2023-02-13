class Rock {
  int x, y, diam, speed;
  PImage rock;


  //Constructor
  Rock() {
    x = int(random(width));
    y = int(random(-100,-1000));
    diam = int(random(50,100));
    speed = int(random(2,8));
    rock = loadImage("rock1.png");
  }
  
  void display() {
    rock.resize(diam,diam);
    imageMode(CENTER);
    image(rock,x,y);
  }
  
  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if(y > height + 100) {
      return true;
    } else {
      return false;
    }
  }
}
