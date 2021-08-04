

/* @pjs font="data/Font.TTf"; */
    
/* @pjs preload="data/wave.png"; */


final char []Asciz= {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
ArrayList <RainArr> arr;
PFont font;
float BaseGraivty = 0.5;
float Gravity = 0.5;
float Width=0;


void setup()
{

  //<background setting>
  size(800, 1200);
  Width = width;
  background(0, 900);

    //setting the array list of arrays.
  arr= new ArrayList <RainArr> (500);
  for (int i =0; i<250; i++)
  {
    char[] temp =new char [int(random(10, 25))];
    for (int j = 0; j<temp.length; j++)
    {
      int set=int(random(Asciz.length-1));
      temp[j]= Asciz[set];
      //println(Asciz[set]);
    }
    arr.add(new RainArr(temp));
  }
  //end of setting

  //<setting font>
  font= createFont("data/Font.TTF", 32);
  textFont(font);
}


void draw()
{
  //println(Asciz[3]);
  background(0, 190);
  check();
  showArr();
}


public void showArr()
{
  for (int i=0; i<arr.size(); i++)
  {
    RainArr temp=arr.get(i);
    showRain(temp);
  }
}

public void showRain(RainArr temp)
{
  float spacing = temp.spacing;
  textSize(spacing+6);
 // fill(20, 150, 200,220);
 fill(20, 200, 120,220);
  tint(220,100);
  int x= temp.x; 
  float y=temp.y;
  for (int i =0; i<temp.rain.length; i++)
  {
    if (i==temp.rain.length-1)
    {
      if (temp.white==true)
        fill(200, 255, 220,250);
    }
    text(temp.rain[i], x, y);  
    //println(temp.rain[i]);
    y+=spacing;
    temp.move();
    temp.change();
  }
}
public void check()
{
  for (int i =0; i<arr.size(); i++)
  {
    RainArr temp = arr.get(i);
    if (temp.y>=height)
    {
      arr.add( new RainArr());
      arr.remove(i);
    }
  }
}


void keyPressed ()
{
  if (keyCode == UP )
    Gravity+=0.1;
   if (keyCode == DOWN )
    Gravity-=0.1;
    
   if(Gravity<0 || Gravity >3)
     Gravity=BaseGraivty;
   
}



class RainArr
{
  float spacing = random(10, 18);
  float fall = random(0.2, 0.5);
  char[]rain;
  int x;
  float y;
  boolean white;


  public RainArr()
  {
    char[] temp =new char [int(random(10, 20))];
    for (int j = 0; j<temp.length; j++)
    {
      int set=int(random(Asciz.length-1));
      temp[j]= Asciz[set];
    }

    generateWhite();
    this.rain=temp;
    this.y=0-rain.length*spacing;
    this.x=int(random(Width));
  }

  public RainArr(char[]rain, int x, float y)
  {
    this.x=x;
    this.y=y-rain.length*spacing;
    this.rain=rain;
    generateWhite();
  }
  public RainArr(char[]rain )
  {
    this.x=int(random(Width));
    this.y=0-rain.length*spacing;
    this.rain=rain;
    generateWhite();
  }
  void move()
  {
    this.y+=fall*Gravity;
  }

  public void change()
  {
    int chance =int(random(1, 60));
    if (chance!=1)
      return;


    for (int i =0; i<rain.length; i++)
    {
      int set=int(random(Asciz.length-1));
      this.rain[i]=Asciz[set]; 
      i+=int(random(1, 5));
    }
  }

  public void generateWhite()
  {
    int r=int(random(0, 5));
    if (r==1)
      this.white=true;
  }
}
