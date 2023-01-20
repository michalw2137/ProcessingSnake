public class CircleButton {
    int x;
    int y;
    int radius;
    color col;

    public CircleButton(int x, int y, int radius, color col) {
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.col = col;
    }

    public void draw() {
        fill(col);
        circle(x,y,radius);
    }

    public boolean isClicked(int x, int y)
    {
        if(Math.pow(x - this.x, 2) + Math.pow(y - this.y, 2) <= Math.pow(this.radius, 2))
        {
            return true;
        }
        else {
            return false;
        }
    }


    public color getColor() {
        return col;
    }
}
