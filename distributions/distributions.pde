/*Submitted by Varda Grover, 
for Homework 2.
- Basic bouncing ball done in HW1 extended to have multiple particles
- Has options for three distributions (random uniform, gaussian, perlin)
- Can on/off showing paths
- Pause/Replay 
- Increase Decrease Radius
*/


int no = 20000;      //no of particles

//Current State
PVector[] x = new PVector[no];
PVector[] v = new PVector[no];
PVector[] a = new PVector[no];

PVector[] x0 = new PVector[no];
PVector[] v0= new PVector[no];
PVector[] a0 = new PVector[no];

boolean[] alive = new boolean[no];

int j = 0;

//Properties of Ball
float m = 100;   //mass
float g = 10;   //gravity
float r = 2;    //radius

//Randomness related
float mean, sd;


//Time Stuff
float h = 0.01;           //step size
float tmax = 0.1;         //simulation time


//Plane (Considering an infinite plane in x-z plane)
PVector plane; 
PVector n = new PVector(0,-1,0);

//Environmental Parameters
float e = 0.75;    //elasticity
float cf = 0.2;   //coefficient of friction
float ar = 2 ;     //air resistance
float d = 2;       //air resistance  (new)
PVector grav = new PVector(0,g,0);    //gravity
PVector vwind = new PVector(0,0,0);   //wind

//Interactivity
boolean looping = true;
boolean showPath = false;
float textSize = 14;
PImage help;
