class Button
{
  float x, y, w, h;
  PFont font;
  boolean isActive;
  String label;
  
  boolean isVisible = true;

  float increase = 10;

  public Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.font = createFont("Georgia", 32);
    isActive = false;
    this.label = label;
  }

  public void drawButton() {
    if(!isVisible) {
      return;  
    }
    if (isActive) {
      fill(50);
      rect(x-increase, y-increase, w+2*increase, h+2*increase);
    } else {
      fill(20);
      rect(x, y, w, h);
    }

    textFont(font, h/2.0f);
    fill(0);
    text(label, x + 10, y + h/2 + textAscent() / 2);
  }

  public boolean isClicked() {
    if(!isVisible) {
      return false;  
    }
    return mouseX > x - increase && mouseX < x + w + increase && mouseY > y - increase && mouseY < y + h + increase;
  }

  void updateButton() {
    if(!isVisible) {
      return;  
    }
    if(isClicked()) {
      isActive = true;  
    } else {
      isActive = false;
    }
  }

  void setVisible(boolean visible) {
    this.isVisible = visible;  
  }
  
}