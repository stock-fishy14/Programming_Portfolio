class Laser {
  int x, y, w, h, speed;
  color c1;
  PImage laser;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w=8;
    h=20;
    speed = 10;
    c1 = color(22, 22, 200);
    laser = loadImage("laser.png");
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    image(laser, x, y);
  }

  void move() {
    y-=speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
