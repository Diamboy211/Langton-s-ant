int[][] grid;
int antx;
int anty;
int dir = 0;
int speed = 400; // Edit this to edit speed

void setup() {
  size(800, 800);
  grid = new int[width][height];
  antx = width/2;
  anty = height/2;
  background(255);
}

void draw() {
  for (int i = 0; i < speed; i++) {
    int[] v = moveForward();
    if (v[2] == 1) {
      stroke(0);
      strokeWeight(1);
      point(v[0], v[1]);
    } else {
      stroke(255);
      strokeWeight(1);
      point(v[0], v[1]);
    }
  }
}

int[] moveForward() {
  int[] vals = new int[3];
  vals[2] = 0;
  if (dir == 0) {
    anty--;
  } else if (dir == 1) {
    antx++;
  } else if (dir == 2) {
    anty++;
  } else if (dir == 3) {
    antx--;
  }
  if (antx > width - 1) antx = 0;
  if (antx < 0) antx = width - 1;
  if (anty > height - 1) anty = 0;
  if (anty < 0) anty = height - 1;
  if (grid[anty][antx] == 1) {
    dir--;
    grid[anty][antx] = 0;
    if (dir == -1) dir = 3;
  } else {
    dir++;
    grid[anty][antx] = 1;
    vals[2] = 1;
    if (dir == 4) dir = 0;
  }
  vals[0] = antx;
  vals[1] = anty;
  return vals;
}
