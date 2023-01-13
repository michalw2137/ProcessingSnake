class Snake {
  
  ArrayList<PVector> positions;
  ArrayList<PVector> directions;

  PVector direction, position;
  boolean isMoving = false;
  int size = 0;

  PImage head, tail;

  Snake() { 
    reset();
  }
  
  void reset() {
    head = loadImage("res/head.png");
    tail = loadImage("res/body.png");
    
    position = new PVector(rightEdge/2, bottomEdge / 2);
    direction = left;
    
    size = startingSize;
    isMoving = true;
      
    positions = new ArrayList<>();
    directions = new ArrayList<>();
    for(int i=0; i<size; i++) {
      positions.add(position.copy());  
      directions.add(direction.copy());
    }  
  }
  
  void move() {
    if(isMoving) {
      positions.add(0, position.copy());
      directions.add(0, direction);
      
      position.x += direction.x * step;
      position.y += direction.y * step;
      
      if(position.x < 0) {
        position.x = rightEdge;  
      }
      if(position.x > rightEdge) {
        position.x = 0;  
      }
      if(position.y < 0) {
        position.y = bottomEdge;  
      }
      if(position.y > bottomEdge) {
        position.y = 0;  
      }
    }  
  }
  
  void tryToEat(PVector food) {
    if(position.equals(food)) {
        println("grow");
        size++;
        setFood();
      }    
  }
  
  void checkCollisions() {
    for(int i = 0; i<size; i++) {
      if(positions.get(i).equals(position)) {
        if(isMoving) {
          println("DEATH");  
        }
        isMoving = false;
        
        menu.isVisible = true;
        restart.isVisible = true;
      }
    }  
  }
  
  
  void drawSnake() {
    //println();
    //println(directions);
    drawBody();
    drawHead();     
  }
  
  void drawBody() {
    fill(200);
    imageMode(CENTER);

    for(int i = 0; i<size; i++) {
      //square(positions.get(i).x, positions.get(i).y, step);        
      pushMatrix();
        translate(positions.get(i).x, positions.get(i).y);
        rotate(angle(directions.get(i)));
        image(tail, 0, 0, step, step);
      popMatrix();
    } 
  }
  
  void drawHead() {
    fill(0,200,0);
    //square(position.x, position.y, step); 
    imageMode(CENTER);
    pushMatrix();
      translate(position.x, position.y);
      rotate(angle(direction));
      image(head, 0, 0, step, step);
    popMatrix();
  }
  
  float angle(PVector dir) {
    float angle = 0;
    if(dir == left) {
      angle = -90; 
    }
    if(dir == right) {
      angle = 90; 
    }
    if(dir == up) {
      angle = 0; 
    }
    if(dir == down) {
      angle = 180; 
    }
    return radians(angle);
  }

  void processKey() {
    if (key == 'w' && direction != down) {
        direction = up;
    }
    if (key == 's' && direction != up) {
        direction = down;
    }
    if (key == 'a' && direction != right) {
        direction = left;
    }
    if (key == 'd' && direction != left) {
        direction = right;
    }    
  }

}
