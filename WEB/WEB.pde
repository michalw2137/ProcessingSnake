PImage headImage, bodyImage;
PFont font;
int score;
String name;

void setup() {
  size(1280,720);
  headImage = loadImage("save/head.png");
  bodyImage = loadImage("save/body.png");
  
  font = createFont("Georgia", 100);
    textFont(font);

  setupGame();

}

void draw() {
  background(0);
  drawFrame();


  fill(250);
  textSize(100);
  text(score, width/2, height*0.2);
  
  fill(50);
  textSize(50);
  text(name, width/2 - textWidth(name)/4, height*0.3);
}
