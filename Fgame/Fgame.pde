import fisica.*;
FWorld world;

FPlayer player;

color white = #FFFFFF;
color black = #000000;
color background = #503197;
color rside = #5b6ee1;
color lside = #e26ee1;
//color Iside = 
color cyan = #5fcde4;  //ice
color yellow = #fbf236; //spikes
color pink = #d77bba; //trampoline
color Lgreen = #4b692f; //tree 4b692f
color Dgreen = #37946e; //tree
color Dbrown = #663931; //tree
color Lbrown = #8f563b; //tree
color red = #ac3232;
color jump1 = #420b0b;

color b = #edf2fb;
color darkBlue = #abc4ff; //purple hue
color lightBlue = #dfe7fd;
color midBlue = #a3c4f3;

color lime = #99e550;



PImage map, ice, stone, treeTrunk1, treeTrunk2, treeLeaf1, treeLeaf2, trampoline, spike; //image file
PImage bridge, Rside, Lside;
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
int lCount = 0;
int l;
int lx, ly;
boolean lavaOn;

//CONTROLS
boolean upkey, downkey, leftkey, rightkey;
boolean wkey, akey, skey, dkey;
boolean spacekey;


//-- Images for character animations
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] attack;
PImage[] hurt;
//
PImage[] action;

//FPoly bridge;

//images for enemies
PImage[] goomba;



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
  ////array
  //jCount = 3;
  //jump = new PImage[jCount];
  //int j = 0;
  //while (j < jCount) {
  //  jump[j] = loadImage("jump" + j + ".png");
  //  j += 1;
  //}
  //jx = 230;
  //jy = 268;
  //jw = 100;
  //jh = 80;

  //array
  lCount = 4;
  lava = new PImage[lCount];
  int l = 0;
  while (l < lCount) {
    lava[l] = loadImage("water" + l + ".png");
    l += 1;
  }
  lx = 300;
  ly = 410;

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
  // sideWall.resize(gridSize, gridSize);
  stone = loadImage("tile_0358.png");
  // stone.resize(gridSize, gridSize);
  ice = loadImage("tile_0336.png");
  //ice.resize(gridSize, gridSize);
  trampoline = loadImage("tile_0333.png");
  // trampoline.resize(gridSize, gridSize);
  treeTrunk1 = loadImage("tile_0001.png");
  //  treeTrunk1.resize(gridSize, gridSize);
  treeTrunk2 = loadImage("tile_0388.png");
  treeLeaf1 = loadImage("tile_0013.png");
  treeLeaf2 = loadImage("tile_0018.png");
  spike = loadImage("tile_0183.png");
  bridge = loadImage("tile_0181.png");

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
  goomba = new PImage[6];
  goomba[0] = loadImage("left.spider-0 copy.png");
  goomba[1] = loadImage("left.spider-1 copy.png");
  goomba[2] = loadImage("left.spider-2 copy.png");
  goomba[3] = loadImage("left.spider-3 copy.png");
  goomba[4] = loadImage("left.spider-4 copy.png");
  goomba[5] = loadImage("left.spider-5 copy.png");
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
        b.attachImage(treeLeaf1);
        b.setName("treeLeaf1");
        world.add(b);
      }
      if (c == Lgreen) {
        b.attachImage(treeLeaf2);
        b.setName("treeLeaf2");
        world.add(b);
      }

      if (c == Dbrown) {
        b.attachImage(treeTrunk1);
        b.setName("treeTrunk1");
        world.add(b);
      }
      if (c == Lbrown) {
        b.attachImage(treeTrunk2);
        b.setSensor(true);
        b.setName("treeTrunk2");
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
      if (c == red) {

        // lCount = 4;
        // lava = new PImage[lCount];
        // int l = 0;
        // while (l < lCount) {
        //   lava[l] = loadImage("water" + l + ".png");
        //   l += 1;
        // }
        // lx = 300;
        // ly = 410;

        //// b.attachImage(lava);
        // b.setSensor(true);
        // b.setName("treeTrunk2");
        // world.add(b);
      }
    }
  }
}



void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void draw() {
  background(black);
  drawWorld();
  actWorld();
}

void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom + width/2, -player.getY()*zoom + height/2);
  scale(zoom);
  world.step();


  // if (player.getX() > jx && player.getX() < jx + 20 && player.getY() < jy  && player.getY() > jy - 15) {
  //if (isTouching1("jump")) {
  //  image(jump[j], jx, jy, 30, 30); //maybe make in the center of the screen
  //  println(frameCount);
  //  if (frameCount % 12 == 0) j += 1;
  //  if (j == jCount) j = 0;
  //} else {
  //  image(jump[0], jx, jy, 30, 30);
  //}




  if (player.getX() > lx && player.getX() < lx + 20 && player.getY() < ly + 20  && player.getY() > ly) {
    image(lava[l], lx, ly, 20, 20); //maybe make in the center of the screen
    println(frameCount);
    if (frameCount % 12 == 0) l += 1;
    if (l == lCount) l = 0;
  } else {
    image(lava[0], lx, ly, 20, 20);
  }




  //if (player.getX() > 260 && player.getX() < 330 && player.getY() < 426  && player.getY() > 365d) {
  //  bridge.setStatic(false);
  // } else {
  //  bridge.setStatic(true);
  // }



  world.draw();
  popMatrix();
}
