/*
  Cool to mess with : 
    - comment the "background" + "attractor loop" in setup
      && uncomment in draw
    - dt
    - particleRadius
*/

float G = 10;
float dt = 0.005;
float coeffVisual = 100;
float limForce = 250;

float attractorMass = 20;
ArrayList<Attractor> attractors;

float nbrParticle;
float particleMass = 1;
float particleRadius = 1;
float particleRed = 100;
float particleGreen = 0;
float particleBlue = 100;
ArrayList<Particle> particles;

void setup() {
  size(600, 600);
  frameRate(30);
  noStroke();

  attractors = new ArrayList<Attractor>();
  Attractor attractor = new Attractor(width/2, height/4, attractorMass);
  attractors.add(attractor);
  attractor = new Attractor(width/4, height/2, attractorMass);
  attractors.add(attractor);
  attractor = new Attractor(3*width/4, height/2, attractorMass);
  attractors.add(attractor);
  attractor = new Attractor(width/2, 3*height/4, attractorMass);
  attractors.add(attractor);

  particles = new ArrayList<Particle>();
  nbrParticle = random(100, 275);
  Particle particle;
  float x;
  float y;
  for (int i=0; i<nbrParticle; i++) {
    x = random(width);
    y = random(height);
    particle = new Particle(x, y, particleMass, 0, 0, particleRadius, particleRed, particleGreen, particleBlue);
    particles.add(particle);
  }
  
  
  background(0);
  for(Attractor currAttractor : attractors){
    currAttractor.display();
  }
}

void draw() {  
  /*background(0);
  for(Attractor currAttractor : attractors){
    currAttractor.display();
  }*/
  
  for(Particle particle : particles){
    particle.update();
  }
  for(Particle particle : particles){
    particle.display();
  }
}

float dist(Particle p, Attractor a) {
  float distance;
  distance = pow(p.old_xPos-a.xPos, 2) + pow(p.old_yPos-a.yPos, 2);
  return pow(distance, 0.5);
}
