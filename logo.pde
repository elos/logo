/* @pjs transparent="true"; */

float pcirclex(float t, float period, float radius) {
  return cos(t) * radius;
}

float pcircley(float t, float period, float radius) {  
  return sin(t) * radius;
}

float pradius(float t, int segments, float radius, float shift) {
  return 50 * sin(t * segments + shift) + radius;
}

void setup() {  // setup() runs once
  size(480, 480);
  frameRate(300);
  background(0, 0, 0, 0);
  stroke(0, 230, 0);
}

float dt = 0.001;
float tau = 2 * PI;

void draw()
{
  float x1, y1, x2, y2;
  float ox, oy;
  float period, r;
  float rad1 = 25;
  float radius, radius2;
  
  int segments;
  
  period = 1000;
  r = 185;
  ox = r + 55;
  oy = r + 55;
  
  segments = 3;
  
  int shift = 10;
  int offset = 3;
  for (float s = (offset + 1) * tau / shift; s <= tau; s += tau / shift) {
    for (float t = 0; t <= tau; t += dt) {
      radius = pradius(t, segments, r, s);
      x1 = pcirclex(t, period, radius);
      y1 = pcircley(t, period, radius);
      point(x1 + ox, y1 + oy);
    }
  }
  noLoop();
}
