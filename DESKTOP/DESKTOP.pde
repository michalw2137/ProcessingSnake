boolean isPlaying = false;

enum State {GAME, MENU, SETTINGS, PAUSE }

float bW = 200, bH = 100;
Button play, settings, menu, restart, selectHead, selectBody, save, exit;
TextField nameField;

Button[] buttons;

State state;

void setup() {
  size(1280,720);
  setupGame();
  
  state = State.MENU;
  
  play = new Button(width/2 - bW/2, height * 0.3 - bH, bW, bH, "PLAY");
  settings = new Button(width/2 - bW/2, height * 0.5 - bH, bW, bH, "SETTINGS");
  exit = new Button(width/2 - bW/2, height * 0.7 - bH, bW, bH, "EXIT");

  menu = new Button(width/2 - 1.5*bW, height * 0.3 - bH, bW, bH, "MENU");
  restart = new Button(width/2 + 0.5*bW, height * 0.3 - bH, bW, bH, "RESTART");

  selectHead = new Button(width/2 - 1.5*bW, height * 0.6 - bH, bW, bH, "browse..");
  selectBody = new Button(width/2 + 0.5*bW, height * 0.6 - bH, bW, bH, "browse..");
  save = new Button(width/2 - bW/2, height * 0.8 - bH, bW, bH, "SAVE");
  
  nameField = new TextField(width/2 - bW/2, height * 0.3 - bH, bW, bH);

  buttons = new Button[]{play, settings, exit, menu, restart, selectHead, selectBody, save, nameField};
  
  setStateMenu();
}

void draw() {
  background(0);
  
  if(state == State.GAME) {
    drawFrame();
  }
  
  if(state == State.SETTINGS) {
    background(0,0,100);  
    drawSettings();
  }
  
  for(Button button : buttons) {
    button.updateButton();
    button.drawButton();
  }
}

void keyPressed() {
  processKey();  
  nameField.keyIsPressed();
}

void mousePressed() {
  if(play.isClicked()) {
    println("PLAY");
    setupGame();
    setStateGame();
  }
  if(settings.isClicked()) {
    println("SETTINGS");

    setStateSettings();
  }
  if(exit.isClicked()) {
    println("EXIT");

    exit();
  }
  
  if(nameField.isClicked()) {
    println("entering name");
  }
  
  if(menu.isClicked()) {
    println("BACK TO MENU");

    setStateMenu(); 
  }
  if(restart.isClicked()) {
    println("RESTART");
    setStateGame();
    setupGame();
  }
  if(save.isClicked()) {
    println("SAVE");
    setStateMenu();
  }
}

void setStateMenu() {
  state = State.MENU;
  for(Button button : buttons) {
    button.setVisible(false);
  }
  play.setVisible(true);
  settings.setVisible(true);
  exit.setVisible(true);
}

void setStateGame() {
  state = State.GAME;
  for(Button button : buttons) {
    button.setVisible(false);
  }
}

void setStatePause() {
  state = State.PAUSE;
  for(Button button : buttons) {
    button.setVisible(false);
  }
  menu.setVisible(true);
  restart.setVisible(true);
}

void setStateSettings() {
  state = State.SETTINGS;
  for(Button button : buttons) {
    button.setVisible(false);
  }
  save.setVisible(true);
  selectHead.setVisible(true);
  selectBody.setVisible(true);
  nameField.setVisible(true);
}
