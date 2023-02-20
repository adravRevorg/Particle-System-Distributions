void mousePressed(){
  //depending on where mouse is pressed, we would update the the wind speed
  //have kept it such that if clicked on right half, wind towards right would be added to existing wind
  //and reverse for left half of the sketch window
  PVector change = new PVector((mouseX- width/2)/100,(mouseY-height/2)/100,0);
  vwind.add(change);
}

void keyPressed(){
      
  if (key=='u'){
     
     loop();
    
     setup_state_random();
     return;
  }
  else if (key=='g'){
    loop();
    setup_state_gausian();
  }
  else if (key=='p'){
    setup_state_perlin();loop();return;
  }
  else if (keyCode==10){
    if (looping) noLoop();
    else         loop();
    looping = !looping;
  }
  else if(keyCode == 8)
    showPath = !showPath;
  else if (key=='i')         r+=2;
  else if (key=='d')         r = max(0,r-0.1);
  
}

  
