class Attractor {
  float xPos;
  float yPos;
  float mass;

  Attractor(float x, float y, float m) {
    this.xPos = x;
    this.yPos = y;
    this.mass = m;
  }
  
  void display(){
    fill(255, 50);
    ellipse(this.xPos, this.yPos, 10, 10);
  }
}
