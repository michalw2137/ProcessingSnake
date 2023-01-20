public class Point {
    int X;
    int Y;
    int pX;
    int pY;
    color col;
    int size;

    public Point(int x, int y, int pX, int pY, color col, int size) {
        X = x;
        Y = y;
        this.pX = pX;
        this.pY = pY;
        this.col = col;
        this.size = size;
    }

    public void show(){
        stroke(col);
        strokeWeight(size);
        line(X,Y,pX,pY);
        
        pg.stroke(col);
        pg.strokeWeight(size);
        pg.line(X,Y,pX,pY);
        
        strokeWeight(0);
        stroke(0);
    }
    
    public void spawnPG(){
        pg.stroke(col);
        pg.strokeWeight(size);
        pg.line(X,Y,pX,pY);
    }
    
    public int getX() {
     return X; 
    }
    
    public int getY() {
     return X; 
    }
    
    public int getpX() {
     return pX; 
    }
    
    public int getpY() {
     return pY; 
    }
    public color getCol() {
     return col; 
    }
    
    public int getSize() {
     return size; 
    }
}
