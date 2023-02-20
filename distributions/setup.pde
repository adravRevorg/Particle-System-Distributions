void setup(){
  fullScreen();
  background(0);
  smooth();
  noStroke();
  fill(255);  
  
  textSize(textSize); 
  colorMode(HSB,360,1,1);
  help = loadImage("help.png");
  help.resize(0, 125);
  plane = new PVector(0,height*0.95,0);
  setup_state_random();
}

void setup_state_random(){
  for(int i=0;i<no;i++){
    x[i] = new PVector(random(width),random(height/2));
    v[i] = new PVector(random(-20,20),random(-10,10));
    a[i] = new PVector(0,random(20),0);
    
    x0[i] = x[i].copy();
    v0[i] = v[i].copy();
    a0[i] = a[i].copy();
    
    alive[i] = true;
  }
  vwind = new PVector(0,0);
  looping = true;
  showPath = false;
}

void setup_state_perlin(){
  
  float scale = random(0.0001,0.009);
  println(scale);
  for(int i=0; i<no; i++){
    
    float xp = i%width;
    float yp = noise(xp*scale)*height/2;
    
    float vxp = i%20;
    float vyp = noise(vxp*scale)*20;
    
    float ap = noise(vxp*scale)*20; 
    
    x[i] = new PVector(xp,yp);
    v[i] = new PVector(vxp,vyp);
    a[i] = new PVector(0,random(20));
    
    x0[i] = x[i].copy();
    v0[i] = v[i].copy();
    a0[i] = a[i].copy();
    
    alive[i] = true;
  }
  vwind = new PVector(0,0);
  looping = true;
  showPath = false;
    
}

void setup_state_gausian(){
  for(int i=0;i<no;i++){
    float xg = randomGaussian();
    mean = width/2; sd = 60;
    xg = (xg*sd)+mean;
    
    float yg = randomGaussian();
    mean = height/4;  
    yg = (yg*sd)+mean;
       
    float vyg =  randomGaussian();
    mean = 0;  sd = 10;
    vyg = (vyg*sd)+mean;
    
    float vxg =  (randomGaussian()*sd)+mean;
    
    
    sd = 4; mean = 4;
    float ayg = (randomGaussian()*sd)+mean;
    
    x[i] = new PVector(xg,yg);
    v[i] = new PVector(vxg,vyg);
    a[i] = new PVector(0,ayg);
    
    x0[i] = x[i].copy();
    v0[i] = v[i].copy();
    a0[i] = a[i].copy();
    
    alive[i] = true;
  }
  vwind = new PVector(0,0);
  looping = true;
  showPath = false;
}
