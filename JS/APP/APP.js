var headImage, bodyImage;
var score;
var playerName;
let json;

function preload() {
  headImage = loadImage("save/head.png");
  bodyImage = loadImage("save/body.png");
  //foodImg = loadImage("res/food.png");
  json = loadJSON("save/replay.json");

}

function loadFromJson() {    
  score = json.score;
  playerName = json.name;
  
  let dirs = json["directions"];
  directions = [];
  for(let i=0; i<dirs.length; i++) {
    let direction = dirs[i];
    let x = direction["x"];
    let y = direction["y"];
    directions.push(new p5.Vector(x, y));
  }
  
  //let foods = json["foodPositions"];
  //foodPositions = [];
  //for(let i=0; i<foods.length; i++) {
  //  let position = foods[i];
  //  let x = position["x"];
  //  let y = position["y"];
  //  foodPositions.push(new p5.Vector(x, y));
  //}
 
  //print("food positions = ", foodPositions);
  print("directions = ", directions);

}


function setup() {
    loadFromJson();

  rectMode(CENTER);
  createCanvas(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100);
      
  setupGame();

}

function draw() {
  background(0);
  drawFrame();


  fill(50);
  textSize(50);
  text("highscore: ", width/3, height*0.2);

  fill(250);
  textSize(100);
  text(score, width/2, height*0.2);
  
  fill(50);
  textSize(50);
  text("by: ", width/3, height*0.3);

  fill(50);
  textSize(50);
  text(playerName, width/2 - textWidth(playerName)/4, height*0.3);
}


var bottomEdge = 0;
var rightEdge = 0;

//var food;

const startingSize = 10;

const step = 30;
const stepSpeed = 30;

const right = new p5.Vector(1,0,0);
const left = new p5.Vector(-1,0,0);
const up = new p5.Vector(0,-1,0);
const down = new p5.Vector(0,1,0);

//var foodPositions;
var directions;

//var foodImg;
var snake;

//var foodIndex;
var directionIndex;


function setupGame(){ 
  //foodIndex = foodPositions.length - 1;
  directionIndex = directions.length - 11;
  
  bottomEdge = int(displayHeight/step) * step;
  rightEdge = int(displayWidth/step) * step;
  
  snake = new Snake();
  snake.directions = directions;
  
  //food = new p5.Vector(0,0);
  //setFood();
}

//function setFood() {
  //food = foodPositions[foodIndex];
  //foodIndex--;
//}

function drawFrame() {
background(0); 
  
  if(directionIndex > 0) {
    snake.direction = directions[directionIndex];
    directionIndex--;
  } else {
    print("exception");
    sleep(1000);
    setupGame(); 
  }
  //print("direction index = ", directionIndex);
  //print("food index = ", foodIndex);
  
  snake.move();
  
  //snake.tryToEat(food);
  snake.drawSnake();

  //fill(200,0,200);
  //imageMode(CENTER);
  //image(foodImg, food.x, food.y, step, step);  
  
  sleep(500);
}

function sleep(millisecondsDuration)
{
  return new Promise((resolve) => {
    setTimeout(resolve, millisecondsDuration);
  })
}

class Snake {
  
  constructor() { 
    this.positions = [];
    this.directions = [];
    
    this.position = createVector(rightEdge/2, bottomEdge / 2);
    this.direction = left;
    
    this.isMoving = true;
    this.size = startingSize;
    
    this.head = headImage;
    this.tail = bodyImage;

    for(let i=0; i<this.size; i++) {
      this.positions.push(this.position.copy());  
      //directions.add(direction.copy());
    }
  }
  
  move() {
    if(this.isMoving) {
      this.positions.push(this.position.copy());
      
      this.position.x += this.direction.x * step;
      this.position.y += this.direction.y * step;
      
      if(this.position.x < 0) {
        this.position.x = rightEdge;  
      }
      if(this.position.x > rightEdge) {
        this.position.x = 0;  
      }
      if(this.position.y < 0) {
        this.position.y = bottomEdge;  
      }
      if(this.position.y > bottomEdge) {
        this.position.y = 0;  
      }
    }  
  }
  
  //tryToEat(food) {
  //  if(this.position.equals(food)) {
  //      print("grow");
  //      this.size++;
  //      setFood();
  //    }    
  //}
  
  checkCollisions() {
    for(let i = 0; i<size; i++) {
      if(this.positions.get(i).equals(this.position)) {
        if(this.isMoving) {
          print("DEATH");  
          isMoving = false;
        }        
      }
    }  
  }
  
  
  drawSnake() {
    this.drawBody();
    this.drawHead();     
  }
  
  drawBody() {
    fill(200);
    imageMode(CENTER);
    //print(this.positions);
    let len = this.positions.length;

    for(let i = 1; i<this.size; i++) {
      //square(positions.get(i).x, positions.get(i).y, step);        
      //push();
      //  translate(this.positions[i].x, this.positions[i].y);
      //  rotate(this.angle(this.directions[i]));
      image(this.tail, this.positions[len-i].x, this.positions[len-i].y, step, step);
      //pop();
    } 
  }
   
  drawHead() {
    fill(0,200,0);
    //square(position.x, position.y, step); 
    imageMode(CENTER);
    push();
      translate(this.position.x, this.position.y);
      rotate(this.angle(this.direction));
      image(this.head, 0, 0, step, step);
    pop();
  }

  angle(dir) {
    var angle = 0;
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

}
