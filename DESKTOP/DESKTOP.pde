boolean isPlaying = false;

enum State {GAME, MENU, SETTINGS, PAUSE }

float bW = 200, bH = 100;
Button play, settings, menu, restart, selectHead, selectBody, save, exit;
TextField nameField;

Button[] buttons;

PImage defaultHead, defaultBody, headImage, bodyImage, background;

State state;

void setup() {
  size(1280,720);
  
  state = State.MENU;
  
  play = new Button(width/2 - bW/2, height * 0.3 - bH, bW, bH, "res/playButton.png");
  settings = new Button(width/2 - bW/2, height * 0.5 - bH, bW, bH, "res/settingsButton.png");
  exit = new Button(width/2 - bW/2, height * 0.7 - bH, bW, bH, "res/exitButton.png");

  menu = new Button(width/2 - bW, height * 0.3 - bH, bW, bH, "res/menuButton.png");
  restart = new Button(width/2 + bW, height * 0.3 - bH, bW, bH, "res/restartButton.png");

  selectHead = new Button(width/2 - 1.5*bW, height * 0.6 - bH, bW, bH, "res/browseButton.png");
  selectBody = new Button(width/2 + 0.5*bW, height * 0.6 - bH, bW, bH, "res/browseButton.png");
  save = new Button(width/2 - bW/2, height * 0.95 - bH, bW, bH, "res/saveButton.png");
  
  nameField = new TextField(width/2 - bW, height * 0.78 - bH, 2*bW, bH);

  buttons = new Button[]{play, settings, exit, menu, restart, selectHead, selectBody, save, nameField};
  
  defaultHead = loadImage("res/head2.png");
  defaultBody = loadImage("res/body2.png");
  
  background = loadImage("res/background.png");
  headImage = defaultHead;
  bodyImage = defaultBody;
  
  setStateMenu();
  state = State.MENU;
}

void draw() {
      background(0, 100, 30); 

  if(state == State.MENU) {
    image(background, 0, 0, width*2, height*2);

  }
  
  if(state == State.GAME || state == State.PAUSE) {
    drawFrame();
  } else if(state == State.SETTINGS) {
    background(0,100,30);  
    image(headImage, selectHead.x, selectHead.y - 200, 200, 200);
    image(bodyImage, selectBody.x, selectBody.y - 200, 200, 200);

  } 
  
  for(Button button : buttons) {
    button.updateButton();
    button.drawButton();
  }
}

void keyPressed() {
  if(state == State.GAME) {
      processKey();  
  }
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
  }
  if(save.isClicked()) {
    println("SAVE");
    setStateMenu();
  }
  
  if(selectHead.isClicked()) {
    println("SELECT HEAD");
    selectInput("Select head file:", "headSelected");  
  }
  if(selectBody.isClicked()) {
    println("SELECT BODY");
    selectInput("Select body file:", "bodySelected");  
  }
}

void headSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    headImage = loadImage(selection.getAbsolutePath()); 
    if(headImage == null) {
      headImage = defaultHead;  
    }
  }
}

void bodySelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    bodyImage = loadImage(selection.getAbsolutePath()); 
    if(bodyImage == null) {
      bodyImage = defaultBody;  
    }
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
  setupGame();
  
  state = State.GAME;
  for(Button button : buttons) {
    button.setVisible(false);
  }
}

void setStatePause() {
  state = State.PAUSE;
  snake.isMoving = false;
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
