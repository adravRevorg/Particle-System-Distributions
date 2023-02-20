void draw(){
  
  if (!showPath)
    clearScreen();
  
  strokeWeight(r);
  for(int i=0;i<no;i++){
    stroke((x[i].x/10)%255,  constrain(x[i].y,0,1), constrain(x[i].y,0,1));  //hsv values are a function of particle location
    point(x[i].x,x[i].y);
  }
  
  
  for(int i=0; i<no; i++){
    
        j = i;
        if (!alive[i])
          continue;
        //simulation loop
        float t = 0;
        h = random(0.01,tmax-0.01);                  //keeping h i.e. the step size random to show that simulation is being displayed at the same irrespective of h
        
        while(t<tmax){
            
          updateState(h);
          float f = collisionDetection();
          if (f!=-1){
              updateStateCollision(f*h);
              if (atRest())
                  alive[i] = false;
              collisionResponse(); 
              updateState((1-f)*h);
              
          }
          t+=h;
        }
    }
  //saveFrame("frames/####.tga");
}

void updateState(float h){
 
  //store previous values
  x0[j] = x[j].copy();
  v0[j] = v[j].copy();
  a0[j] = a[j].copy();
  
  
  //get new state values
  a[j] = PVector.add(grav, PVector.mult(PVector.sub(vwind,v0[j]),d/m));
  v[j].add(PVector.mult(a0[j],h));  // v(n+1) = v(n) + a(n)*h
  x[j].add(PVector.mult(v0[j],h));  // x(n+1) = x(n) + v(n)*h
}

void updateStateCollision(float h){
  
  //this time we recompute current state, so prev state doesnt change as of now
  v[j] = PVector.add(v0[j],(PVector.mult(a0[j],h)));  // v(n+1) = v(n) + a(n)*h
  x[j] = PVector.add(x0[j], PVector.mult(v0[j],h));  // x(n+1) = x(n) + v(n)*h
    
}

void draw_planes(){
  
  rect(0,plane.y,width,2);
}

void clearScreen(){
  background(0);
  
  text("FrameRate  : " + frameRate, 20,20);
  text("No of Particles : " + no, 20, 40);
  
  image(help,width*0.6,10);
  
  
  draw_planes();
}
