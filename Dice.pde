void setup()
{
  size(400, 400);
  noLoop();
  frameRate(10.0);
  textAlign(CENTER);
  textSize(15);
}
void draw()
{ 
  background(250, 300, 300);
  
  int diceNum = 42;
  int total = 0;
  int Roy = 200;
  int G = 225;
  int Biv = 200;
  
  for(int x = 10; x <= 375; x = x+55){
    for(int y = 10; y <= 300; y = y+55){
      Die bob = new Die(x, y, Roy, G, Biv);
      bob.roll();
      bob.show();
      Roy = Roy - 4;
      G = G - 4;
      Biv = Biv - 4;
      bob.disappear();
      
      total= total + bob.numRoll;
      if(bob.numRoll == 1){
        total--;
        diceNum--;
      }
  }
  }
  float avg = (float)total/(float)diceNum;
  fill(0);
  text("total= " + total, 200, 360);
  text("average= " + avg, 200, 380);
}
void mousePressed()
{
  redraw();
}

class Die 
{
  int myX, myY, numRoll, colourA, colourB, colourC;
  
  Die(int x, int y, int a, int b, int c)
  {
    myX = x;
    myY = y;
    colourA = a;
    colourB = b;
    colourC = c;
  }
  void roll()
 {
    numRoll = (int)(Math.random()*6)+1;
  }
  void show()
  {
    fill(colourA, colourB, colourC);
    rect(myX, myY, 50, 50);
    if(numRoll==1){
      fill(colourA - 50, colourB - 50, colourC - 50);
      ellipse(myX + 25, myY + 25, 5, 5);
    }
    else if(numRoll==2){
      fill(colourA - 50, colourB - 50, colourC - 50);
      ellipse(myX + 15, myY + 15, 5, 5);
      ellipse(myX + 35, myY + 35, 5, 5);
    }
    else if(numRoll==3){
      fill(colourA - 50, colourB - 50, colourC - 50);
      ellipse(myX + 10, myY + 10, 5, 5);
      ellipse(myX + 25, myY + 25, 5, 5);
      ellipse(myX + 40, myY + 40, 5, 5);
    }
    else if(numRoll==4){
      fill(colourA - 50, colourB - 50, colourC - 50);
      ellipse(myX + 15, myY + 15, 5, 5);
      ellipse(myX + 35, myY + 35, 5, 5);
      ellipse(myX + 15, myY + 35, 5, 5);
      ellipse(myX + 35, myY + 15, 5, 5);
    }
    else if(numRoll==5){
      fill(colourA - 50, colourB - 50, colourC - 50);
      ellipse(myX + 10, myY + 10, 5, 5);
      ellipse(myX + 40, myY + 40, 5, 5);
      ellipse(myX + 10, myY + 40, 5, 5);
      ellipse(myX + 40, myY + 10, 5, 5);
      ellipse(myX + 25, myY + 25, 5, 5);
    }
    else if(numRoll==6){
      fill(colourA - 50, colourB - 50, colourC - 50);
      ellipse(myX + 15, myY + 10, 5, 5);
      ellipse(myX + 15, myY + 25, 5, 5);
      ellipse(myX + 15, myY + 40, 5, 5);
      ellipse(myX + 35, myY + 10, 5, 5);
      ellipse(myX + 35, myY + 25, 5, 5);
      ellipse(myX + 35, myY + 40, 5, 5);
    }
    }
    void disappear(){
      if(numRoll == 1){
      fill(300, 150, 150);
      stroke(300, 150, 150);
      rect(myX, myY, 50, 50);
      stroke(0, 0, 0);
      }
    }
}
