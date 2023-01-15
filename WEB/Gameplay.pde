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

ArrayList<PVector> foodPositions, directions;

PImage foodImg;
Snake snake;

int foodIndex, directionIndex;


void setupGame(){
  load();
  println(foodPositions);
  
  foodIndex = 0;
  directionIndex = directions.size() - 11;
  
  foodImg = loadImage("res/food.png");

  bottomEdge = int(height/step) * step;
  rightEdge = int(width/step) * step;
  
  snake = new Snake();
  snake.directions = directions;
  
  food = new PVector(0,0);
  setFood();
}

void setFood() {
  food = foodPositions.get(foodIndex);
  foodIndex++;
}

void drawFrame() {
  background(0); 
  
  try {
    snake.direction = directions.get(directionIndex);
    directionIndex--;
  } catch (IndexOutOfBoundsException e){
    delay(500);
    setupGame(); 
  }
  
  snake.move();
  
  snake.tryToEat(food);
  println(food, snake.position, snake.direction);
  snake.drawSnake();

  fill(200,0,200);
  imageMode(CENTER);
  image(foodImg, food.x, food.y, step, step);  
  
  delay(75);
}
