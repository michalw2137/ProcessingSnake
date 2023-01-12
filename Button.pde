class Button
{
  float x;
  float y;
  float width;
  float height;
  PFont font;
  boolean isActive;
  float sliderWidth;
  String label;

  public Button(float x, float y, float width, float height, PFont font, String label) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.font = font;
    isActive = false;
    this.sliderWidth = 150.0f;
    this.label = label;
  }

  public void draw()
  {
    if (isActive) {
      fill(180);
    } else {
      fill(250);
    }
    rect(x, y, width, height);

    textFont(font, height/2.0f);
    fill(0);
    text(label, x + 10, y + textAscent());
  }

  public boolean isClicked()
  {
    return mouseX > x && mouseX < x + width && mouseY > y && mouseY < y + height;
  }


  
}
