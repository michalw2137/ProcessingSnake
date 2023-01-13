boolean isPlaying = false;

float bW = 200, bH = 100;
Button play, settings, menu, restart;

Button[] buttons;

void setup() {
  size(1280,720);
  setupGame();
  
  play = new Button(width/2 - bW/2, height * 0.3 - bH, bW, bH, "PLAY");
  settings = new Button(width/2 - bW/2, height * 0.5 - bH, bW, bH, "SETTINGS");
  menu = new Button(width/2 - 1.5*bW, height * 0.3 - bH, bW, bH, "MENU");
  restart = new Button(width/2 + 0.5*bW, height * 0.3 - bH, bW, bH, "RESTART");

  menu.setVisible(false);
  restart.setVisible(false);
  
  buttons = new Button[]{play, settings, menu, restart};
}

void draw() {
  background(0);
  
  if(isPlaying) {
    drawFrame();
  }
  
  for(Button button : buttons) {
    button.updateButton();
    button.drawButton();
  }
}

void keyPressed() {
  processKey();  
}

void mousePressed() {
  if(play.isClicked()) {
    println("PLAY");
    play.setVisible(false);
    settings.setVisible(false);
    isPlaying = true;
  }
  if(settings.isClicked()) {
    println("SETTINGS");
  }
  if(menu.isClicked()) {
    isPlaying = false;  
    setup();
  }
  if(restart.isClicked()) {
    menu.setVisible(false);
    restart.setVisible(false);
    setupGame();
  }
  
}
