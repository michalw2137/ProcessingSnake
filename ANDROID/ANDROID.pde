   import select.files.*;

SelectLibrary files;

boolean grantedRead = false;
boolean grantedWrite = false;

String fileName = "";

ArrayList<Point> lineArr = new ArrayList<>();
int size = 25;
color col = color(128, 128, 128);

int headNumber = 0, bodyNumber = 0;

CircleButton white;
CircleButton black;
CircleButton red;
CircleButton green;

CircleButton blue;
CircleButton cyan;
CircleButton magenta;
CircleButton yellow;

CircleButton blue2;
CircleButton cyan2;
CircleButton magenta2;
CircleButton yellow2;

CircleButton smallest;
CircleButton small;
CircleButton medium;
CircleButton big;
CircleButton biggest;

Button saveHead, saveBody;
PGraphics pg;

public void setup() {
  size(displayWidth, displayHeight);
  println(displayWidth, displayHeight);
  println(width, height);
  
  pg = createGraphics(width, width);
  pg.beginDraw();
  pg.fill(0,100,30);
  pg.rect(0, 0, width, width);
        noStroke();

  ellipseMode(CENTER);
    
  saveHead = new Button(20, width + 20, 240, 240, "save\nas\nhead");
  saveBody = new Button(20, width + 300, 240, 240, "save\nas\nbody");
  
  white = new CircleButton(330, width + 100, 100, color(0,0,0));
  black = new CircleButton(460, width + 100, 100, color(128,128,128));
  red = new CircleButton(590, width + 100, 100, color(255,255,255));
  green = new CircleButton(720, width + 100, 100, color(0,50,250));
  
  blue = new CircleButton(330, width + 250, 100, color(0,40,0));
  cyan = new CircleButton(460, width + 250, 100, color(0,70,0));
  magenta = new CircleButton(590, width + 250, 100, color(0,100,30));
  yellow = new CircleButton(720, width + 250, 100, color(0,200,0));
      
  blue2 = new CircleButton(330, width + 400, 100, color(255,255,0));
  cyan2 = new CircleButton(460, width + 400, 100, color(255,200,0));
  magenta2 = new CircleButton(590, width + 400, 100, color(200,100,0));
  yellow2 = new CircleButton(720, width + 400, 100, color(200,0,0));
  
  smallest = new CircleButton(width/5*1 - 50, width+700, 20, color(255,255,255));
  small =    new CircleButton(width/5*2 - 50, width+700, 40, color(255,255,255));
  medium   = new CircleButton(width/5*3 - 50, width+700, 60, color(255,255,255));
  big      = new CircleButton(width/5*4 - 50, width+700, 80, color(255,255,255));
  biggest  = new CircleButton(width/5*5 - 50, width+700, 100, color(255,255,255));

  files = new SelectLibrary(this);
  requestPermissions();
}

public void draw() {
    background(100, 200, 100);

    stroke(0);
    strokeWeight(0);
    
    fill(0, 100, 30);
    rect(0, 0, width, width);
    
    
     for(int i=0; i<lineArr.size(); i++) {
        lineArr.get(i).show();
    }
    
    fill(100, 200, 100);
    rect(0, width, width, height);
    
    
    saveHead.draw();
    saveBody.draw();

    white.draw();
    black.draw();
    red.draw();
    green.draw();
    
    blue.draw();
    cyan.draw();
    magenta.draw();
    yellow.draw();
    
    blue2.draw();
    cyan2.draw();
    magenta2.draw();
    yellow2.draw();
    
    smallest.draw();
    small.draw();
    medium.draw();
    big.draw();
    biggest.draw();
    
    fill(col);
    circle(mouseX, mouseY, size/2);
    if(mousePressed && mouseY < width){
        Point temp = new Point(mouseX, mouseY, pmouseX, pmouseY, col, size);
        lineArr.add(temp);
    }
   
        noStroke();

}

public void mousePressed() {
    if(white.isClicked(mouseX, mouseY)){
        col = white.getColor();
    }
    if(black.isClicked(mouseX, mouseY)){
        col = black.getColor();
    }
    if(red.isClicked(mouseX, mouseY)){
        col = red.getColor();
    }
    if(green.isClicked(mouseX, mouseY)){
        col = green.getColor();
    }
    
    if(blue.isClicked(mouseX, mouseY)){
        col = blue.getColor();
    }
    if(cyan.isClicked(mouseX, mouseY)){
        col = cyan.getColor();
    }
    if(magenta.isClicked(mouseX, mouseY)){
        col = magenta.getColor();
    }
    if(yellow.isClicked(mouseX, mouseY)){
        col = yellow.getColor();
    }
    
    if(blue2.isClicked(mouseX, mouseY)){
        col = blue2.getColor();
    }
    if(cyan2.isClicked(mouseX, mouseY)){
        col = cyan2.getColor();
    }
    if(magenta2.isClicked(mouseX, mouseY)){
        col = magenta2.getColor();
    }
    if(yellow2.isClicked(mouseX, mouseY)){
        col = yellow2.getColor();
    }
    
    if(smallest.isClicked(mouseX, mouseY)){
        size = smallest.radius;
    }
    if(small.isClicked(mouseX, mouseY)){
        size = small.radius;
    }
    if(medium.isClicked(mouseX, mouseY)){
        size = medium.radius;
    }
    if(big.isClicked(mouseX, mouseY)){
        size = big.radius;
    }
    if(biggest.isClicked(mouseX, mouseY)){
        size = biggest.radius;
    }
    
    if (saveHead.isClicked()) {
      files.selectFolder("Select a folder to process:", "folderSelected");
      fileName = "head" + headNumber++;
    }
    if (saveBody.isClicked()) {
      files.selectFolder("Select a folder to process:", "folderSelected");
      fileName = "body" + bodyNumber++;

    }
}

    
void folderSelected(File selection) {
  if (selection == null) {
    println("Nothing was selected.");
  } else {
    println("User selected: " + selection.getAbsolutePath());
    
    //pg.beginDraw();
    //for(int i=0; i<lineArr.size(); i++)
    //    lineArr.get(i).spawnPG();
    pg.endDraw();
    pg.save(selection.getAbsolutePath() + "/" + fileName + ".png");
    
    println("SAVED AT: " + selection.getAbsolutePath() + "/" + fileName + ".png");
  }
}

void requestPermissions() {
  // if you need to save files, request this as well 
  if (!hasPermission("android.permission.WRITE_EXTERNAL_STORAGE")) {
    requestPermission("android.permission.WRITE_EXTERNAL_STORAGE", "handleWrite");
  }
}

void handleRead(boolean granted) {
  if (granted) {
    grantedRead = granted;
    println("Granted read permissions.");
  } else {
    println("Does not have permission to read external storage.");
  }
}

void handleWrite(boolean granted) {
  if (granted) {
    grantedWrite = granted;
    println("Granted write permissions.");
  } else {
    println("Does not have permission to write external storage.");
  }
}

    
