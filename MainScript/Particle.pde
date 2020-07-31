class Particle {
  float new_xPos;
  float new_yPos;
  float old_xPos;
  float old_yPos;

  float mass;
  float xAccel;
  float yAccel;
  float xSpeed;
  float ySpeed;

  float radius;
  float red;
  float green;
  float blue;

  Particle(float x, float y, float m, float xs, float ys, float r, float re, float g, float b) {
    this.old_xPos = x;
    this.old_yPos = y;
    this.mass = m;
    this.xAccel = 0;
    this.yAccel = 0;
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.radius = r;
    this.red = re;
    this.green = g;
    this.blue = b;
  }

  void update() {
    this.xAccel = 0;
    this.yAccel = 0;

    float currForce;
    float currAccel;
    float currAngle;
    for (Attractor attractor : attractors) {
      currForce = 0;
      currAccel = 0;
      currAngle = 0;

      currForce = coeffVisual*G*(this.mass*attractor.mass)/dist(this, attractor);
      if (abs(currForce) > limForce) {
        currAccel = currForce*limForce/( abs(currForce)*this.mass);
      } else {
        currAccel = currForce/this.mass;
      }

      float x = this.old_xPos - attractor.xPos;
      float y = this.old_yPos - attractor.yPos;
      if (x>=0 && y>=0) {
        currAngle = PI + acos(abs(x)/dist(this, attractor));
      } else if (x<=0 && y<=0) {
        currAngle = acos(abs(x)/dist(this, attractor));
      } else if (x<=0 && y>=0) {
        currAngle = - acos(abs(x)/dist(this, attractor));
      } else if (x>=0 && y<=0) {
        currAngle = PI - acos(abs(x)/dist(this, attractor));
      } else {
        println("ERROR");
        noLoop();
        break;
      }

      this.xAccel += currAccel*cos(currAngle);
      this.yAccel += currAccel*sin(currAngle);
    }

    this.xSpeed += this.xAccel*dt;
    this.ySpeed += this.yAccel*dt;

    this.new_xPos = this.old_xPos + this.xSpeed*dt;
    this.new_yPos = this.old_yPos + this.ySpeed*dt;
  }

  void display() {
    fill(this.red, this.green, this.blue, 100);
    ellipse(this.old_xPos, this.old_yPos, 2*this.radius, 2*this.radius);

    this.old_xPos = this.new_xPos;
    this.old_yPos = this.new_yPos;
  }
}
