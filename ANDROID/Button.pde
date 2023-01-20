public class Button {
    int x;
    int y;
    int width;
    int height;
    int sliderLen;
    String text;
    boolean isActive = false;

    public Button(int xg, int yg, int widthg, int heightg, String textx){
        x = xg;
        y = yg;
        width = widthg;
        height = heightg;
        sliderLen = x;
        text = textx;
    }

    public void draw()
    {
        fill(100, 252, 100);
       
        rect(x, y, width, height);

        fill(0, 50, 0);
        textSize(50);
        text(text, x + 60, y + 80);
    }

    public boolean isClicked()
    {
        if(mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height)
        {
            return true;
        }
        else {
            return false;
        }
    }
}
