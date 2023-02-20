//collision detection 
//if yes, determine f (fraction of timestep) 
//if no, return -1
float collisionDetection(){
  
  float d0 = n.dot(PVector.sub(x0[j],plane)) + r;
  float d1 = n.dot(PVector.sub(x[j],plane)) - r;
  
  if ((d0*d1)<0){
    float f = abs(d0)/(abs(d0)+abs(d1));
    return f;
  }
  return -1;
  
}

void collisionResponse(){
  
  //what's our collision response ?
  //our velocities will change
  PVector v_bc = v[j].copy();                      //bc : before collision
  PVector v_bcN = PVector.mult(n,n.dot(v_bc));  //bcN : before collision normal part
  PVector v_bcT = PVector.sub(v_bc,v_bcN);      //bcT : before collision tangential part
  
  //normal component would be -1*e*v
  PVector v_acN = PVector.mult(v_bcN,-e);                  //ac : after collision
  PVector v_acT = PVector.mult(v_bcT,max(0,(1-cf)));
  v[j] = PVector.add(v_acN,v_acT);
  
}

//check if at rest or not
boolean atRest(){
  
  if (v[j].mag()>20)    return false;              //not slow enough to consider for rest (Condition 1 in book)
  
  
  float d = n.dot(PVector.sub(x[j],plane)) + r;
  if (abs(d)>100)    return false;              //not near enough to the plane to consider rest  (Condition 2 in book)
  
  if (PVector.dot(a[j],n)>0.0001)  return false;                           //force isnt opposite to plane, ex : vertical plane   (Condition 3 in book)
  
  PVector aN = PVector.mult(n,n.dot(a[j]));
  PVector aT = PVector.sub(a[j],aN);
  if ((aT.mag()-aN.mag()*cf)>0.0001)               return false;        //(Condition 4 in book) 
      
  
  return true;
}
