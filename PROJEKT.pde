ArrayList<PVector> body;
ArrayList<PVector> positions;
PVector direction, position;

int size = 0;

boolean isMoving = false;

float bottomEdge = 0;
float rightEdge = 0;

PVector food;

final int startingSize = 10;

final float step = 30;

final PVector right = new PVector(1,0);
final PVector left = new PVector(-1,0);
final PVector up = new PVector(0,-1);
final PVector down = new PVector(0,1);


void setup() {
  size(1280,720);

  bottomEdge = int(height/step) * step;
  rightEdge = int(width/step) * step;
 
  position = new PVector(rightEdge/2, bottomEdge / 2);
  direction = left;
  
  size = startingSize;
  isMoving = true;
    
  positions = new ArrayList<>();
  for(int i=0; i<size; i++) {
    positions.add(position.copy());  
  }
  
  
  food = new PVector(0,0);
  setFood();
}

void setFood() {
  food.x = step * int(random(1, width/step));  
  food.y = step * int(random(1, height/step));  
}

void draw() {
  background(0); 
  
  if(isMoving) {
    positions.add(0, position.copy());
    
    position.x += direction.x * step;
    position.y += direction.y * step;
  }
  
  if(position.equals(food)) {
    println("grow");
    size++;
    setFood();
  }
  
  fill(200);
  for(int i = 0; i<size; i++) {
    if(positions.get(i).equals(position) && isMoving) {
      println("DEATH");  
      isMoving = false;
    }
    square(positions.get(i).x, positions.get(i).y, step);  
  }
  
  fill(0,200,0);
  square(position.x, position.y, step);  

  fill(200,0,200);
  square(food.x, food.y, step);  

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
  
  
  delay(100);
}

void keyPressed() {
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
  
  if (key == 'r') {
      setup();
  }
}
