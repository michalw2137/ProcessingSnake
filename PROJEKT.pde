float bottomEdge = 0;
float rightEdge = 0;

PVector food;

final int startingSize = 10;

final float step = 30;

final PVector right = new PVector(1,0);
final PVector left = new PVector(-1,0);
final PVector up = new PVector(0,-1);
final PVector down = new PVector(0,1);

Snake snake = new Snake();

void setup() {
  size(1280,720);
  bottomEdge = int(height/step) * step;
  rightEdge = int(width/step) * step;
  
  snake.reset();
  
  food = new PVector(0,0);
  setFood();
}

void setFood() {
  food.x = step * int(random(1, width/step));  
  food.y = step * int(random(1, height/step));  
}

void draw() {
  background(0); 
  
  snake.move();
  
  snake.tryToEat(food);
  snake.checkCollisions();
  
  snake.drawSnake();

  fill(200,0,200);
  square(food.x, food.y, step);  
  
  delay(100);
}

void keyPressed() {
  snake.processKey();
  
  if (key == 'r') {
      setup();
  }
}
