//R = 3;
//r = 1.11;
//p = 0.3;
//theta = linspace(0,100*pi,10000);
//phi = R / r * theta;
//x1 = (R - r) * cos(theta);
//y1 = (R - r) * sin(theta);
//x2 = p * cos(-phi);
//y2 = p * sin(-phi);
//x = x1 + x2;
//y = y1 + y2;
//plot(x,y)
//float a = 240, b = 130.0, h = 150, t = 0;
//float a = 240, b = 10.0, h = 50, t = 0;
//float a = 180, b = 30.0, h = 50, t = 0;
float a = 240, b = 100.0, h = 150, t = 0;
float x, y;
float xx[], yy[];
boolean click = false;
void setup() {
  size(900, 900);
  stroke(#190AFC);
  frameRate(120);
  background(0);
  smooth();
  colorMode(HSB, 255, 255, 255);
  xx = new float[360];
  yy = new float[360];
  noCursor();
}
void draw() {
  strokeWeight(3);
  if (!click) {
    b = mouseX;
    h = mouseY;
  }
  for (int r = 0; r<360; r+=1) {
    xx[r] = (a-b)*cos(radians(r));
    yy[r] = (a-b)*sin(radians(r));
  }
  if (!click)
    background(0);
  translate(450, 450);
  noFill();
  stroke(#FC0313);
  if (!click)
    ellipse(0, 0, 2*a, 2*a);
  t+=0.010;
  float big = 57.3;
  stroke(#03FC32);
  if (!click)
    ellipse(xx[int(big*t)%360], yy[int(big*t)%360], 2*b, 2*b);
  x = (a-b)*cos(t)+h*cos((a-b)/b*t);
  y = (a-b)*sin(t)-h*sin((a-b)/b*t);
  float d = dist(x, y, 0, 0);
  //for(float s = 0;s<t;s+=0.01){
  //x = (a-b)*cos(t)+h*cos((a-b)/b*t);
  //y = (a-b)*sin(t)-h*sin((a-b)/b*t);
  //stroke(1, 255, 255);
  //point(x, y);
  //}
  stroke(#6050FF);
  if (!click)
    line(xx[int(big*t)%360], yy[int(big*t)%360], x, y);

  stroke(d,255,255);
  strokeWeight(6);
  point(x, y);
}
void mousePressed() {
  click = !click;
  background(0);
}