class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(150);
    c2 = color(180);
    on = false;
  }

  void display() {
    fill(130);
    if (on && val == 'C') {
      fill(160, 0, 0);
    } else if (on == false && val == 'C') {
      fill(250, 0, 0);
    } else if (on && val == '÷') {
      fill(0, 80, 220);
    } else if (on == false && val == '÷') {
      fill(0, 120, 250);
    } else if (on && val == 'x') {
      fill(0, 80, 220);
    } else if (on == false && val == 'x') {
      fill(0, 120, 250);
    } else if (on && val == '-') {
      fill(0, 80, 220);
    } else if (on == false && val == '-') {
      fill(0, 120, 250);
    } else if (on && val == '+') {
      fill(0, 80, 220);
    } else if (on == false && val == '+') {
      fill(0, 120, 250);
    } else if (on && val == '=') {
      fill(20, 100, 0);
    } else if (on == false && val == '=') {
      fill(20, 160, 0);
    } else if (on) {
      fill(130);
      
    } else {
      fill(150);
    }
    rect(x, y, w, h, 12);
    textAlign(CENTER);
    textSize(17);
    fill(0);
    if (val == 'C') {
      text("Clear", x+w/2, (y+h/2) +4);
    } else if (val =='²') {
      text("x²", x+w/2, (y+h/2) +4);
    } else {
      text(val, x+w/2, (y+h/2)+4);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}
