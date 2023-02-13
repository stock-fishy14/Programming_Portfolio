// Dallin Morgan | 28 Nov 2022 | SpaceGame
import processing.sound.*;
SoundFile blaster, explosion,explosion1, end;
SpaceShip s1,s2;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Timer powerUpTimer, powerUpTimer1, rockTimer;
Star[] stars = new Star[200];
int score, level, rockCount, laserCount, rockTime, rocksPassed;
boolean play;

void setup() {
  size(800, 800);
  end = new SoundFile(this,"sadendgame.wav");
  explosion1 = new SoundFile(this,"explosion1.wav");
  blaster = new SoundFile(this, "blaster1.wav");
  explosion = new SoundFile(this, "explode.wav");
  s1 = new SpaceShip();
  s2 = new SpaceShip();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  rockTime = 800;
  rockCount = 0;
  rocksPassed = 0;
  laserCount = 0;
  rockTimer = new Timer(rockTime);
  rockTimer.start();
  powerUpTimer = new Timer(14000);
  powerUpTimer.start();
  powerUpTimer1 = new Timer(6000);

  score = 0;
  level = 1;
  play=false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    noCursor();
    // Rendering Stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    // Add powerups
    if (powerUpTimer.isFinished()) {
      powerups.add(new PowerUp());
      powerUpTimer.start();
      println("Powerups: " + powerups.size());
    }
    // Rendering powerups
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp p = powerups.get(i);
      if (p.intersect(s1)) {
        powerups.remove(p);
        if (p.type == 'H') {
          s1.health += 100;
        } else if (p.type == 'A') {
          s1.ammo += 100;
        } else {
          if (s1.turretCount == 5) {
            s1.turretCount = 5;
          } else {
            s1.turretCount++;
          }
        }
      }
      if (p.reachedBottom()) {
        powerups.remove(p);
      } else {
        p.display();
        p.move();
      }
    }
    // Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      rockCount++;
      println("Rocks: " + rocks.size());
    }
    // Rendering Rocks
    for (int i = 0; i < rocks.size(); i ++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        explosion1.stop();
        explosion1.play();
        s1.health -= r.diam;
        score -= r.diam;
        // todo: add sound of explosion
        // todo: add animation of explosion
        // todo visual effect on ship
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocksPassed ++;
        score -= r.diam;
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
      for (int j = 0; j < lasers.size(); j ++) {
        Laser l = lasers.get(j);
        if (l.intersect(r)) {
          explosion.stop();
          explosion.play();
          score += r.diam;
          // todo: add sound of explosion
          // todo: add animation of explosion
          // todo visual effect on ship
          rocks.remove(r);
          lasers.remove(l);
        }
      }
    }
    noCursor();
    // Render lasers on the screen

    for (int i = 0; i < lasers.size(); i ++) {
      Laser l = lasers.get(i);
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }

    s1.display(mouseX, mouseY);
    infoPanel();

    if (s1.health<1 || rocksPassed>9 || s1.lCount <1) {
      gameOver();
    }
  }
}
// Add Laser based on event
void mousePressed() {
  if (play) {
    blaster.stop();
    blaster.play();
    handleEvent();
  }
}

void keyPressed() {
  if (key == ' ') {
    handleEvent();
  }
}

void handleEvent() {
  if (s1.fire() && s1.turretCount ==1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount ==2) {
    lasers.add(new Laser(s1.x - 15, s1.y));
    lasers.add(new Laser(s1.x + 15, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount ==3) {
    lasers.add(new Laser(s1.x -20, s1.y));
    lasers.add(new Laser(s1.x +20, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount ==4) {
    lasers.add(new Laser(s1.x -20, s1.y));
    lasers.add(new Laser(s1.x -5, s1.y));
    lasers.add(new Laser(s1.x + 5, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount ==5) {
    lasers.add(new Laser(s1.x -40, s1.y));
    lasers.add(new Laser(s1.x -20, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x +20, s1.y));
    lasers.add(new Laser(s1.x +40, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void infoPanel() {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textAlign(CENTER);
  textSize(25);
  text("SPACEGAME" + " | Level: " + level + " | Score: " + score + " | Ammo: " + s1.lCount + " | Health: " + s1.health + " | Rocks Passed: " + rocksPassed, width/2, 35);
}

void startScreen() {
  background(0);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Click or press any key to start...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  } else {
    play = false;
  }
}

void gameOver() {
  end.play();
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  text("Score: " + score, width/2, height/2 +40);
  noLoop();
}
