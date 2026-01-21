import fisica.*;
import processing.sound.*;
FWorld world;

FPlayer player;
FBox hammerbro;
PImage[] IntroScreen;
int IntroC;


//SOUND
SoundFile BgMusic;
SoundFile Collect;
SoundFile Intro;
SoundFile Winner;





//npc
int DNPC;
boolean npcGONE = false;
boolean keyOn = false;
boolean keyTaken = false;
int nx = 720;
boolean emeraldOn = false;


//MODE FRAMEWORK
int MODE;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 3;
final int PAUSE = 4;



PFont dogo;
PFont chees;


color Dino = #34a0a4;
color white = #FFFFFF;
color black = #000000;
color background = #503197;
color rside = #5b6ee1;
color lside = #f1a8e1;
color Invside = #f00a0a;
color cyan = #5fcde4;  //ice
color yellow = #fbf236; //spikes
color pink = #d77bba; //trampoline

color Dgreen = #37946e; //tree
color Dbrown = #663931; //tree

color red = #ac3232;
color jump1 = #420b0b;
color orange = #f44000;
color ghosty = #1afff5;
color cdoor = #ff955c;

color b = #edf2fb;
color darkBlue = #abc4ff; //purple hue
color lightBlue = #dfe7fd;
color midBlue = #a3c4f3;

color lime = #99e550;
color gmba = #ff9725;
color Bgreen = #356126;
color pt = #eb64ff;
color hb = #2f2f2f; //hammerbro

//boolean gravity
boolean gOFF = false;
boolean pOFF = false; // f bodies
boolean kOFF = false;
int i;
int fx, fy, gx, gy;





PImage map, ice, stone, treeTrunk, treeLeaf, trampoline, spike, door; //image file
PImage bridge, Rside, Lside, INVside, ladder, thwomp1, thwomp2, savePoint, emerald, hammer, npc1, keyy, enemy2, enemy1, coin;
int gridSize = 20; //change size of F boxes
float zoom = 1.5;
ArrayList<FGameObject> terrain;


//animation of collapsing bridge
//PImage[] jump;
//int jCount = 0;
//int j;
//int jx, jy, jw, jh;
//boolean jumpOn;

PImage[] lava;


//CONTROLS
boolean upkey, downkey, leftkey, rightkey;
boolean wkey, akey, skey, dkey;
boolean mkey;
boolean spacekey;
boolean thwompOn;


//-- Images for character animations
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] attack;
PImage[] hurt;
//
PImage[] action;

PImage[] t1;
int jCount = 0;
int j;
int jx, jy, jw, jh;


//FPoly bridge;

//images for enemies
PImage[] goomba;
PImage[] ghost;
PImage[] HammerBro;
//FGoomba GOOM = new FGoomba();

FBox greenBox;


boolean touchingSomething(FBox player) {
  ArrayList<FContact> contacts = player.getContacts();
  if (contacts.size() > 0) {
    return true;
  } else {
    return false;
  }
}

boolean isTouching1(String n) {
  ArrayList<FContact> contacts = player.getContacts();
  for (int i = 0; i < contacts.size(); i++) {
    FContact fc = contacts.get(i);
    if (fc.contains(n)) {
      return true;
    }
  }
  return false;
}






void setup() {
  size(700, 500);
  Fisica.init(this);
  terrain = new ArrayList<FGameObject>();
  loadImages();
  
  //GIF
 // IntroCount =
  
  
  
  
BgMusic = new SoundFile(this, "background.mp3");
Collect = new SoundFile(this, "collect.wav");
//Intro = new soundFile(this, "");
//Winner = new SoundFile(this, "");


  //Sound.amps(0.7);

 
   //TEXT
  dogo = createFont("dogicapixelbold copy.otf", 80);
  chees = createFont("dogicapixel copy.otf", 40);
  

  gx = 40;
  gy = 0;

  //array
  jCount = 3;
  t1 = new PImage[jCount];
  int j = 0;
  while (j < jCount) {
    t1[j] = loadImage("jump" + j + ".png");
    j += 1;
  }
  jx = 100;
  jy = 100;
  jw = 100;
  jh = 1000;

  //a rect(1260, 1050, 55, 10);


  loadWorld(map);
  loadPlayer();
  //map.get(0, 0);
  //map.width of our image
  //map.height
}

void loadImages() {
  map = loadImage("platform2.png");
  Rside = loadImage("RIGHTtile.png");
  Lside = loadImage("LEFTtile.png");
  thwomp1 = loadImage("thwomp0.png");
  thwomp2 = loadImage("thwomp1.png");
  // sideWall.resize(gridSize, gridSize);
  stone = loadImage("tile_0358.png");
  // stone.resize(gridSize, gridSize);
  ice = loadImage("tile_0336.png");
  //ice.resize(gridSize, gridSize);
  trampoline = loadImage("tile_0333.png");
  // trampoline.resize(gridSize, gridSize);
  treeTrunk = loadImage("tile_0034.png");
  treeTrunk.resize(50, 50);
  treeLeaf = loadImage("tile_0033.png");
  treeLeaf.resize(80, 80);
  spike = loadImage("tile_0183.png");
  bridge = loadImage("tile_0181.png");
  ladder = loadImage("ladder1.png");
  ladder.resize(20, 30);
  emerald = loadImage("emerald.png");
  savePoint = loadImage("tile_0021.png");
  hammer = loadImage("hammer.png");
  hammer.resize(30, 30);
  npc1 = loadImage("npc1.png");
  npc1.resize(40, 40);
  keyy = loadImage("key.png");
  door = loadImage("door.png");
  door.resize(40, 40);
  enemy2 = loadImage("enemy2.png");
  enemy1 = loadImage("ghost1.png");
  coin = loadImage("coin.png");





  lava = new PImage[6];
  lava[0] = loadImage("lava0.png");
  lava[0] = loadImage("lava0.png");
  lava[0] = loadImage("lava0.png");
  lava[1] = loadImage("lava1.png");
  lava[1] = loadImage("lava1.png");
  lava[1] = loadImage("lava1.png");
  lava[2] = loadImage("lava2.png");
  lava[3] = loadImage("lava3.png");
  lava[4] = loadImage("lava4.png");
  lava[5] = loadImage("lava5.png");



  //load actions
  idle = new PImage[4];
  idle[0] = loadImage("Dino1.png");
  idle[1] = loadImage("Dino2.png");
  idle[2] = loadImage("Dino3.png");
  idle[3] = loadImage("Dino4.png");

  run = new PImage[6];
  run[0] = loadImage("Dino5.png");
  run[1] = loadImage("Dino6.png");
  run[2] = loadImage("Dino7.png");
  run[3] = loadImage("Dino8.png");
  run[4] = loadImage("Dino9.png");
  run[5] = loadImage("Dino10.png");

  jump = new PImage[1];
  jump[0] = loadImage("Dino13.png");

  attack = new PImage[3];
  attack[0] = loadImage("Dino11.png");
  attack[1] = loadImage("Dino12.png");
  attack[2] = loadImage("Dino13.png");

  hurt = new PImage[4];
  hurt[0] = loadImage("Dino14.png");
  hurt[1] = loadImage("Dino15.png");
  hurt[2] = loadImage("Dino16.png");
  hurt[3] = loadImage("Dino17.png");

  action = idle;
  //---------------------

  //enemies-----------------------------
  goomba = new PImage[2];
  goomba[0] = loadImage("enemy1.png");
  goomba[0].resize(60, 60);
  goomba[1] = loadImage("enemy2.png");
  goomba[1].resize(60, 60);

  //ghost
  ghost = new PImage[2];
  ghost[0] = loadImage("ghost1.png");
  ghost[0].resize(60, 60);
  ghost[1] = loadImage("ghost1.png");
  ghost[1].resize(60, 60);
  
  
 
}





//void makeBridge() {
//  bridge = new FPoly();

//  //shape
//  stroke(255);
//  fill(255);
//  bridge.vertex(260, 420);
//  bridge.vertex(330, 420);
//  bridge.vertex(330, 426);
//  bridge.vertex(260, 426);


//  // define properties
//  bridge.setPosition(8, -50);
//  bridge.setStroke(255);
//  bridge.setFillColor(255);
//  bridge.setFriction(4);

//// bridge.setStatic(true);

//  //put it in the world
//  world.add(bridge);
//}


void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000); //fisica don't work outside this
  world.setGravity(0, 900);
  //makeBridge();




  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize + 158, y* gridSize + 130);
      b.setStatic(true);
      if (c == black) { //stone block
        b.attachImage(stone);
        b.setFriction(5);
        b.setName("stone");
        // stone.resize(35, 35);
        world.add(b);
      }
      if (c == Invside) {
        b.attachImage(stone);
        b.setSensor(true);
        b.setName("Invside");
        world.add(b);
      }


      if (c == rside) {
        b.attachImage(Rside);
        b.setFriction(4.5);
        b.setName("RWall");
        // stone.resize(35, 35);
        world.add(b);
      }
      if (c == lside) {
        b.attachImage(Lside);
        b.setFriction(4.5);
        b.setName("RWall");
        // stone.resize(35, 35);
        world.add(b);
      }


      if (c == cyan) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      if (c == pink) {
        b.attachImage(trampoline);
        b.setFriction(5);
        b.setName("trampoline");
        world.add(b);
      }
      if (c == yellow) {
        b.attachImage(spike);
        b.setName("spike");
        world.add(b);
      }
      if (c == Dgreen) {
        b.attachImage(treeLeaf);
        b.setSensor(false);
        b.setName("treeLeaf");
        world.add(b);
      }

      if (c == Dbrown) {
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("treeTrunk");
        world.add(b);
      }

      if (c == jump1) {
        b.setRestitution(1.5);
        b.attachImage(trampoline);
        b.setFriction(5);
        b.setName("jump");
        world.add(b);
      }

      if (c == lime) {
        FBridge br = new FBridge(x*gridSize + 158, y* gridSize + 130);
        terrain.add(br);
        world.add(br);
      }

      if (c == gmba) {
        FGoomba gb = new FGoomba(x*gridSize + 120, y* gridSize + 60);
        terrain.add(gb);
        world.add(gb);
      }

      if (c == Bgreen) {
        b.attachImage(ladder);
        b.setFriction(5);
        b.setSensor(true);
        b.setName("ladder");
        world.add(b);
      }

      if (c == pt) {
        FThwomp th = new FThwomp(x*gridSize + 158, y* gridSize + 130);
        terrain.add(th);
        world.add(th);
      }

      if (c == orange) {
        b.attachImage(savePoint);
        b.setFriction(5);
        b.setName("savePoint");
        world.add(b);
      }

      if (c == red) {
        FLava lv = new FLava(x*gridSize + 155, y* gridSize + 130);
        terrain.add(lv);
        world.add(lv);
      }
      if (c == ghosty) {
        FGhost gh = new FGhost(x*gridSize + 30, y* gridSize -300);
        terrain.add(gh);
        world.add(gh);
      }
      
      if (c == hb) {
        FHammerBro hb  = new FHammerBro(x*gridSize + 80, y* gridSize + 130);
        terrain.add(hb);
        world.add(hb);
      }
      
        if (c == cdoor) {
        b.attachImage(door);
        b.setName("door");
        b.setSensor(true);
        world.add(b);
      }

      
      
    }
  }
}





void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void draw() {
  if ( MODE == INTRO) {
    intro();
  } else if (MODE == GAME) {
    game();
  } else if (MODE == GAMEOVER) {
    gameover();
  } else if (MODE == PAUSE){
    pause();
  }
  
}




void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    strokeWeight(3);
    stroke(255);
    gOFF = true;
  } else {
    strokeWeight(2);
    stroke(#34a0a4);
    gOFF = false;
  }
}


//void tact(int x, int y, int w, int h) {
//  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
//    strokeWeight(3);
//    stroke(255);
//    pOFF = true;
//  } else {
//    stroke(0);
//    pOFF = false;
//  }
//}


boolean mousePressed = false;
boolean mp = false;

void mousePressed() {
  if (gOFF && !mousePressed) {
    world.setGravity(0, 0);
    mousePressed = true;
  } else if (gOFF && mousePressed) {
    world.setGravity(0, 900);
    mousePressed = false;
  }

  if (MODE == INTRO && !gOFF) {
    introClicks();
  } else if (MODE == GAME && !gOFF) {
    gameClicks();
  } else if (MODE == GAMEOVER && !gOFF) {
    gameoverClicks();
  } else if (MODE == PAUSE && !gOFF){
    pauseClicks();
  }
}

//void makeBox() {
//  greenBox = new FBox(0, 0);
//  greenBox.setPosition(gx, gy);


//  greenBox.setStroke(255);
//  greenBox.setStrokeWeight(2);
//  greenBox.setFillColor(255);

//  //set physical properties
//  greenBox.setDensity(0.2);
//  greenBox.setFriction(3);
//  greenBox.setRestitution(0.25);
//  world.add(greenBox);
//}
