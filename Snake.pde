class Snake {

  ArrayList<PVector> body;
  ArrayList<PVector> positions;
  PVector direction, position;
  boolean isMoving = false;
  int size = 0;

  Snake() { }
  
  void reset() {
    position = new PVector(rightEdge/2, bottomEdge / 2);
    direction = left;
    
    size = startingSize;
    isMoving = true;
      
    positions = new ArrayList<>();
    for(int i=0; i<size; i++) {
      positions.add(position.copy());  
    }  
  }
  
  void move() {
    if(isMoving) {
      positions.add(0, position.copy());
      
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
      if(positions.get(i).equals(position) && isMoving) {
        println("DEATH");  
        isMoving = false;
      }
    }  
  }
  
  void drawSnake() {
    drawBody();
    drawHead();     
  }
  
  void drawBody() {
    fill(200);
    for(int i = 0; i<size; i++) {
      square(positions.get(i).x, positions.get(i).y, step);  
    } 
  }
  
  void drawHead() {
    fill(0,200,0);
    square(position.x, position.y, step); 
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
