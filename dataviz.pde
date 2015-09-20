/*
Tanner Heffner
ARTD 252 Project 3
Prof. Park
Data Visualization
"the blink of an eye"

============
If everything goes to plan, I graduate next term. It feels like my 
college experience has gone by in the blink of an eye. How long is 
a blink? How many blinks was college really? 

Why did they go so fast?
============
CONTROLS:
20 events, mapped consecutively to the keyboard rows of 1-0 & Q-P
1 = first icon
...
P = last icon
============
code uses the HYPE framework, & is greatly indebted to:
".../examples/HSwarm/example_002.pde" also found at:
http://www.hypeframework.org/examples/HSwarm/example_002/index.html
*/

HDrawablePool pool0, pool1, pool2, pool3, pool4, pool5, pool6, pool7, pool8, pool9, pool10, pool11, pool12, pool13, pool14, pool15, pool16, pool17, pool18, pool19;
HSwarm swarm0, swarm1, swarm2, swarm3, swarm4, swarm5, swarm6, swarm7, swarm8, swarm9, swarm10, swarm11, swarm12, swarm13, swarm14, swarm15, swarm16, swarm17, swarm18, swarm19;
HTimer timer0, timer1, timer2, timer3, timer4, timer5, timer6, timer7, timer8, timer9, timer10, timer11, timer12, timer13, timer14, timer15, timer16, timer17, timer18, timer19;

//20 icon images
PImage i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19; 
PImage [] icons = new PImage[20];
//font used
PFont font1;

void setup() {
size(1050, 600);

//load in the font & images
font1 = createFont("DroidSerifRegular.ttf", 24);
i0 = loadImage("search.png");
i1 = loadImage("blink.png");
i2 = loadImage("snapchat.png");
i3 = loadImage("skip3.png");
i4 = loadImage("coffee.png");
i5 = loadImage("teapot.png");
i6 = loadImage("shower.png");
i7 = loadImage("bike.png");
i8 = loadImage("pizza2.png");
i9 = loadImage("tv.png");
i10 = loadImage("class.png");
i11 = loadImage("lab.png");
i12 = loadImage("day.png");
i13 = loadImage("week.png");
i14 = loadImage("quarter.png");
i15 = loadImage("basketball.png");
i16 = loadImage("college.png");
i17 = loadImage("cd.png");
i18 = loadImage("school.png");
i19 = loadImage("old.png");
icons[0] = i0; icons[1] = i1; icons[2] = i2; icons[3] = i3; icons[4] = i4;
icons[5] = i5; icons[6] = i6; icons[7] = i7; icons[8] = i8; icons[9] = i9;
icons[10] = i10; icons[11] = i11; icons[12] = i12; icons[13] = i13; icons[14] = i14;
icons[15] = i15; icons[16] = i16; icons[17] = i17; icons[18] = i18; icons[19] = i19;
imageMode(CENTER);

//load in HYPE framework
  H.init(this).background(0).autoClear(false); 
  smooth();

//load images (no for loop because it seems to mess with HSwarm)
image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); 
image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);
image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);
image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50);   

//explanatory text
 HText f0 = new HText("icon keys (in order): 1-0, Q-P",24,font1); 
 f0.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f0);
}

void draw(){
 H.drawStage(); 
}


//Here's where the code starts to get kind of messy:

//keys used to trigger swarms are, in order:
// 1; 2; 3; 4; 5; 6; 7; 8; 9; 0;
//'Q'; 'W'; 'E'; 'R'; 'T'; 'Y'; 'U'; 'I'; 'O'; 'P';
//1-0 = icons[0]-[9], Q-P = icons[10]-[19]
void keyPressed(){

if (key == '1'){
  
//creates the blink effect
//also wipes away the trails left by spawned rectangles
  H.background(0).autoClear(true);
  H.background(0).autoClear(false);

//reload icons
image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); 
image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);
image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);
image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

//box to cover any pre-existing icon markers
HRect b2 =  new HRect();
b2
.noStroke()
.fill(0)
.size(width, 50)
.anchorAt(H.CENTER | H.BOTTOM)
.loc(width/2, 100) ;
H.add(b2); 

//current icon marker
HEllipse m1 = new HEllipse(2);
m1
.noStroke()
.fill(#FFFFFF)
.anchorAt(H.CENTER)
.loc(50, 85)
;
H.add(m1);

//box to cover any pre-existing text
HRect b1 = new HRect();
b1
.noStroke()
.fill(0)
.size(width, 100)
.anchorAt(H.CENTER | H.BOTTOM)
.loc(width/2,height-50) ;
H.add(b1); 
 
// label & blinkcount for the current icon/swarm
  HText f1 = new HText("google search for 'how long is a blink of an eye' (.23 seconds) = .69 blinks",24,font1); f1.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f1);

//sets swarm color
  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

//parameters for entire swarm
  swarm0 = new HSwarm()
  .goal(width/2, height/2)
  .speed(4)
  .turnEase(0.025f)
  .twitch(2)
 ;

pool0 = new HDrawablePool(1); //needs to equal whatever icon/key
pool0.autoAddToStage()        //is pressed.

 //this is for each little block in the swarm. 1 block = 1 blink
  .add (new HRect()
  .rounding(4)
  .size(2,1))
  
 //making each block rotate around the center
  .onCreate(    new HCallback(){ 
    public void run(Object obj) {
      float rotation = random(TWO_PI);
      HDrawable d = (HDrawable) obj;
    d
      .noStroke().
      fill( colors.getColor() )
      .loc(width/2, height/2)
      .rotationRad(rotation++)
      .move(20*cos(rotation), 20*sin(rotation))
      .anchorAt( H.CENTER );      
     swarm0.addTarget(d);
       }});
//controls the spawn rate + keeps track of how many have spawned
timer0 = new HTimer()
  .numCycles ( pool0.numActive() )
  .interval(330) //330 so each wave takes 1 real-time blink
  .callback(
    new HCallback(){
       public void run(Object obj){
         pool0.request();
       }});    
}
//HYPE method chaining used to greatly condense code.
//each key is the same code as above, except for text displayed &
//the int of swarm#, pool#, HDrawablePool(#), & timer#.
if (key == '2'){
  H.background(0).autoClear(true);
  H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); 
image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);
image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);
image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 
 
HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(100, 85);
H.add(m1); 
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  
 
  HText f2 = new HText("blink of an eye (330 milliseconds) = 1 blink",24,font1); 
  f2.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f2);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm1 = new HSwarm()
  .goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool1 = new HDrawablePool(1); 
pool1.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm1.addTarget(d);
       }});

timer1 = new HTimer()  .numCycles ( pool1.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool1.request();
       }});    
}
if (key == '3'){
  H.background(0).autoClear(true);
  H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 
 
HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(150, 85);
H.add(m1);  
 
 HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  
 
  HText f3 = new HText("average snapchat length (5 seconds) = 15.15 blinks",24,font1); 
  f3.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f3);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm2 = new HSwarm()
  .goal(width/2, height/2)  .speed(4).turnEase(0.025f).twitch(2);

pool2 = new HDrawablePool(15); 
pool2.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm2.addTarget(d);
       }});

timer2 = new HTimer()  .numCycles ( pool2.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool2.request();
       }});    
}
if (key == '4'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 
 
HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(200, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f4 = new HText("youtube ads (15 seconds) = 45.45 blinks",24,font1); 
  f4.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f4);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm3 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool3 = new HDrawablePool(45); 
pool3.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm3.addTarget(d);
       }});

timer3 = new HTimer()  .numCycles ( pool3.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool3.request();
       }});    
}
if (key == '5'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(250, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  
 
  HText f5 = new HText("NBA regulation shotclock (24 seconds) = 72.72 blinks",24,font1); 
  f5.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f5);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm4 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool4 = new HDrawablePool(72); 
pool4.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm4.addTarget(d);
       }});

timer4 = new HTimer()  .numCycles ( pool4.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool4.request();
       }});    
}
if (key == '6'){
H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 
 
HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(300, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f6 = new HText("brew a cup of coffee (3 minutes 20 seconds) = 606.06 blinks",24,font1); 
  f6.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f6);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm5 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool5 = new HDrawablePool(606); 
pool5.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm5.addTarget(d);
       }});

timer5 = new HTimer()  .numCycles ( pool5.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool5.request();
       }});    
}
if (key == '7'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(350, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f7 = new HText("boil water in electric teapot (4 minutes) = 727.27 blinks",24,font1); 
  f7.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f7);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm6 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool6 = new HDrawablePool(727); 
pool6.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm6.addTarget(d);
       }});

timer6 = new HTimer()  .numCycles ( pool6.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool6.request();
       }});    
}
if (key == '8'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(400, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f8 = new HText("water-conscious shower (5 minutes) = 909.09 blinks",24,font1); 
  f8.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f8);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm7 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool7 = new HDrawablePool(909); 
pool7.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm7.addTarget(d);
       }});

timer7 = new HTimer()  .numCycles ( pool7.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool7.request();
       }});    
}
if (key == '9'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(450, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f9 = new HText("daily bike commute (15 minutes) = 2727.27 blinks",24,font1); 
  f9.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f9);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm8 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool8 = new HDrawablePool(2727); 
pool8.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm8.addTarget(d);
       }});

timer8 = new HTimer()  .numCycles ( pool8.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool8.request();
       }});    
}
if (key == '0'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(500, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  

  HText f10 = new HText("'thirty minutes or it's free' pizza delivery guarantee (30 minutes) = 5454.54 blinks",24,font1); 
  f10.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f10);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm9 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool9 = new HDrawablePool(5454); 
pool9.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm9.addTarget(d);
       }});

timer9 = new HTimer()  .numCycles ( pool9.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool9.request();
       }});    
}
if (key == 'Q' || key == 'q'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(550, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  
  
  HText f11 = new HText("hour-long tv program with no commercials (45 minutes) = 8181.81 blinks",24,font1); 
  f11.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f11);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm10 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool10 = new HDrawablePool(8181); 
pool10.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm10.addTarget(d);
       }});

timer10 = new HTimer()  .numCycles ( pool10.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool10.request();
       }});    
}
if (key == 'W' || key == 'w'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(600, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  
 
  HText f12 = new HText("one class (50 minutes) = 9090.90 blinks",24,font1); 
  f12.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f12);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm11 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool11 = new HDrawablePool(9090); 
pool11.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm11.addTarget(d);
       }});

timer11 = new HTimer()  .numCycles ( pool11.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool11.request();
       }});    
}
if (key == 'E' || key == 'e'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(650, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f13 = new HText("one lab (110 minutes) = 20,000 blinks",24,font1); 
  f13.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f13);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm12 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool12 = new HDrawablePool(20000); 
pool12.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm12.addTarget(d);
       }});

timer12 = new HTimer()  .numCycles ( pool12.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool12.request();
       }});    
}
if (key == 'R' || key == 'r'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(700, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f14 = new HText("max CD length (80 minutes) = 14,545.45 blinks",24,font1); 
  f14.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f14);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm13 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool13 = new HDrawablePool(14545); 
pool13.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm13.addTarget(d);
       }});

timer13 = new HTimer()  .numCycles ( pool13.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool13.request();
       }});    
}
if (key == 'T' || key == 't'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 
 
HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(750, 85);
H.add(m1);  
 
HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f15 = new HText("one day (24 hours) = 261,818.18 blinks",24,font1); 
  f15.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f15);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm14 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool14 = new HDrawablePool(261818); 
pool14.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm14.addTarget(d);
       }});

timer14 = new HTimer()  .numCycles ( pool14.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool14.request();
       }});    
}
if (key == 'Y' || key == 'y'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(800, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f16 = new HText("one week (7 days) = 1,832,727.27 blinks",24,font1); 
  f16.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f16);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm15 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool15 = new HDrawablePool(1832727); 
pool15.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm15.addTarget(d);
       }});

timer15 = new HTimer()  .numCycles ( pool15.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool15.request();
       }});    
}
if (key == 'U' || key == 'u'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(850, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  

  HText f17 = new HText("one quarter (11 weeks) = 20,159,999.97 blinks",24,font1); 
  f17.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f17);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm16 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool16 = new HDrawablePool(20159999); 
pool16.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm16.addTarget(d);
       }});

timer16 = new HTimer()  .numCycles ( pool16.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool16.request();
       }});    
}
if (key == 'I' || key == 'i'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(900, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);   
 
  HText f18 = new HText("college (12 quarters + 8 weeks of summer school) = 256,581,817.8 blinks",24,font1); 
  f18.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f18);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm17 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool17 = new HDrawablePool(256581817); 
pool17.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm17.addTarget(d);
       }});

timer17 = new HTimer()  .numCycles ( pool17.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool17.request();
       }});    
}
if (key == 'O' || key == 'o'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 

HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(950, 85);
H.add(m1); 

HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  

  HText f19 = new HText("sixteen years of school total (roughly 832 weeks) = 1,524,829,088.64 blinks",24,font1); 
  f19.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f19);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm18 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool18 = new HDrawablePool(1524829088); 
pool18.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm18.addTarget(d);
       }});

timer18 = new HTimer()  .numCycles ( pool18.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool18.request();
       }});    
}
if (key == 'P' || key == 'p'){
  H.background(0).autoClear(true); H.background(0).autoClear(false);

image(i0, 50, 50); image(i1, 100, 50); image(i2, 150, 50); image(i3, 200, 50); image(i15, 250, 50); image(i4, 300, 50); image(i5, 350, 50); image(i6, 400, 50); image(i7, 450, 50); image(i8, 500, 50);image(i9, 550, 50); image(i10, 600, 50); image(i11, 650, 50); image(i17, 700, 50); image(i12, 750, 50);image(i13, 800, 50); image(i14, 850, 50); image(i16, 900, 50); image(i18, 950, 50); image(i19, 1000, 50); 
 
HRect b2 =  new HRect();
b2.noStroke().fill(0).size(width, 50).anchorAt(H.CENTER | H.BOTTOM).loc(width/2, 100) ;
H.add(b2); 

HEllipse m1 = new HEllipse(2);
m1.noStroke().fill(#FFFFFF).anchorAt(H.CENTER).loc(1000, 85);
H.add(m1);  
 
 HRect b1 = new HRect();
b1.noStroke().fill(0).size(width, 100).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50) ;
H.add(b1);  
 
  HText f20 = new HText("twenty-two years old = 2,069,639,996.88 blinks",24,font1); 
  f20.fill(#FFFFFF).anchorAt(H.CENTER | H.BOTTOM).loc(width/2,height-50); 
  H.add(f20);

  final HColorPool colors = new HColorPool(#E0EEEE, #AFEEEE, #39B7CD, #05B8CC, #65909A, #62B1F6, #0D4F8B, #3B6AA0, #1D7CF2, #6D9BF1, #2E37FE, #4D4DFF, #6600FF, #380474, #283A90, #6F7285, #0276FD, #74BBFB, #63D1F4);

  swarm19 = new HSwarm().goal(width/2, height/2).speed(4).turnEase(0.025f).twitch(2);

pool19 = new HDrawablePool(2096639996); 
pool19.autoAddToStage()           
  .add (new HRect()  .rounding(4)  .size(2,1))
    .onCreate(    new HCallback(){  public void run(Object obj) {float rotation = random(TWO_PI);HDrawable d = (HDrawable) obj;
    d.noStroke().fill( colors.getColor() ).loc(width/2, height/2).rotationRad(rotation++).move(20*cos(rotation), 20*sin(rotation)).anchorAt( H.CENTER );      
     swarm19.addTarget(d);
       }});

timer19 = new HTimer()  .numCycles ( pool19.numActive() ).interval(330)
  .callback( new HCallback(){public void run(Object obj){
         pool19.request();
       }});    
}

}

