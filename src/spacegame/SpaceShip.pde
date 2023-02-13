class SpaceShip {
  int x, y, w, lCount, turretCount, ammo, health;
  PImage ship;

  // Constructor
  SpaceShip() {
    x = 0;
    y = 0;
    w = 90;
    lCount = 1000;
    turretCount = 1;
    health = 1000;
    ship = loadImage("ship.png");
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    imageMode(CENTER);
    ship.resize(150, 150);
    image(ship, x, y);
  }

  void move() {
  }

  boolean fire() {
    if (lCount>0) {
      lCount --;
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
