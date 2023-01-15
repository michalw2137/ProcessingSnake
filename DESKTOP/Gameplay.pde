float bottomEdge = 0;
float rightEdge = 0;

PVector food;

final int startingSize = 10;

final float step = 30;
final float stepSpeed = 30;

final PVector right = new PVector(1,0,0);
final PVector left = new PVector(-1,0,0);
final PVector up = new PVector(0,-1,0);
final PVector down = new PVector(0,1,0);

ArrayList<PVector> foodPositions;

PImage foodImg;
Snake snake;

void setupGame(){
  foodPositions = new ArrayList<>();
  
  foodImg = loadImage("res/food.png");

  bottomEdge = int(height/step) * step;
  rightEdge = int(width/step) * step;
  
  snake = new Snake();
  
  food = new PVector(0,0);
  setFood();
}

void setFood() {
  food.x = stepSpeed * int(random(1, width/step));  
  food.y = stepSpeed * int(random(1, height/step));  
  foodPositions.add(food.copy());
}

void drawFrame() {
  background(0); 
  
  snake.move();
  
  snake.tryToEat(food);
  snake.checkCollisions();
  
  snake.drawSnake();

  fill(200,0,200);
  imageMode(CENTER);
  image(foodImg, food.x, food.y, step, step);  
  
  delay(75);
}

void processKey() {
  snake.processKey();
  

}
