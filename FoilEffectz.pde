class FoilEffectz {

  float x;
  float y;
  float size;
  float shine;
  
  FoilEffectz(int chance) { 
    switch(chance) {
      case 1:
        this.effect1();
        break;
      case 2:
        this.effect2();
        break;
      case 3:
        this.effect3();
        break;
      case 4:
        this.effect4();
        break;
      case 5:
        this.effect5();
        break;
    }
  }

  void effect1() {
    for (int i = 0; i < 15; ++i) {
  
      x = random(0, width);
      y = random(0, height);
  
      size = random(100, 400);
      
      shine = random(5, 50);
  
      fill(#35DB62, shine);
      noStroke();
      circle(x, y, size);
    }
  }
  
  void effect2() {
    for (int i = 0; i < 15; ++i) {
  
      x = random(0, width - 100);
      y = random(0, height);
  
      size = random(100, 400);
      
      shine = random(5, 50);
  
      fill(#F01FED, shine);
      noStroke();
      rect(x, y, size, size);
    }
  }
  
  void effect3(){
    for (int i = 0; i < 15; ++i) {
      
      x = random(0, width - 100);
      y = random(0, height);
  
      size = random(-300, 500);
      
      shine = random(5, 50);
      
      fill(#E6EA13, shine);
      noStroke();
      triangle(x, y, x + size, y, x + size / 2, y + size);
    }
  }
  
  void effect4(){
    for (int i = 0; i < 15; ++i) {

      x = random(0, width - 100);
      y = random(0, height);
  
      size = random(300, 500);
      
      float weight = random(10, 100);
       
      shine = random(5, 50);
       
      stroke(#DB3E43, shine);
      strokeCap(ROUND);
      strokeWeight(weight);
      line(x, y, x + size, y - size); 
    }
  }
  
  void effect5(){
    size = 10;  
    shine = 10;
        
    for (int i = 0; i < width; i+=20) {
      float r = random(100, 255);
      float g = random(0, 128);
      
        for (int u = 0; u < height; u+=20){
          x = i + 10;
          y = u + 10;
          
          fill(r, g, 60, shine);
          noStroke();
          ellipse(x, y, size, size);
        }
        shine+=2;
        
        size++;
    }
  }
}
