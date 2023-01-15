class TextField extends Button {
  
  String name;
    
  TextField(float x, float y, float w, float h) {
    super(x, y, w, h, "enter name");
    name = "";
  }
  
  public void drawButton() {
    if(!isVisible) {
      return;  
    }
    if (isActive) {
      fill(200);
      rect(x, y, w, h);
    } else {
      fill(20);
      rect(x, y, w, h);
    }

    textFont(font, h/2.0f);
    fill(0);
   
    if(name.isEmpty() || name.isBlank()) {
      text(label, x + 10, y + h/2 + textAscent() / 2); 
    } else {
      text(name, x + 10, y + h/2 + textAscent() / 2); 
    }
    
  }
    
  void keyIsPressed() {
    if(!isActive || !isVisible) {
      return;  
    }
    if(key == BACKSPACE) {
      if(name.length() > 0) {
        name = name.substring(0, name.length() - 1);
      }
      return;
    } 
    if (key == CODED || key == ENTER || key == TAB || key == RETURN || key == ESC || key == DELETE) {
      if(keyCode != SHIFT) {
        isActive = false;
      }
      return;  
    }
    name += key;
  }
  

  public boolean isClicked() {
    boolean clicked = super.touchesMouse();
    isActive = clicked;
    return clicked;  
  }
  
  void updateButton(){}
  
  String getName() {
    if(name.isEmpty() || name.isBlank()) {
      return "player";  
    }
    return name;
  }
}
