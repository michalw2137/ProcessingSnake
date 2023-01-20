class Button
{
  float x, y, w, h;
  boolean isActive;
  String label;
  PImage image;
  boolean isVisible = true;

  float increase = 10;

  public Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    isActive = false;
    this.label = label;
    if(!label.equals("enter name")) image = loadImage(label);
  }

  public void drawButton() {
    if(!isVisible) {
      return;  
    }
    if (isActive) {
      image(this.image, x-increase, y-increase, w+2*increase, h+2*increase);
    } else {
      fill(50);
      image(this.image, x, y, w, h);
    }

  }

  public boolean isClicked() {
    if(!isVisible) {
      return false;  
    }
    return touchesMouse();  
  }

  private boolean touchesMouse() {
    if(!isVisible) {
      return false;  
    }
    return mouseX > x - increase && mouseX < x + w + increase && mouseY > y - increase && mouseY < y + h + increase;
  }

  void updateButton() {
    if(!isVisible) {
      return;  
    }
    if(touchesMouse()) {
      isActive = true;  
    } else {
      isActive = false;
    }
  }

  void setVisible(boolean visible) {
    this.isVisible = visible;  
  }
  
}
