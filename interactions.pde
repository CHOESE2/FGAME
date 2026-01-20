void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  //------------------------------------------------
  if (key == 'A' || key == 'a') akey = true;
  if (key == 'D' || key == 'd') dkey = true;
  if (key == 'W' || key == 'w') wkey = true;
  if (key == 'S' || key == 's') skey = true;
  if (key == 'M' || key == 'm') mkey = true;
  if (key == ' ') spacekey = true;
}


void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  //------------------------------------------------
  if (key == 'A' || key == 'a') akey = false;
  if (key == 'D' || key == 'd') dkey = false;
  if (key == 'W' || key == 'w') wkey = false;
  if (key == 'S' || key == 's') skey = false;
  if (key == 'M' || key == 'm') mkey = false;
  if (key == ' ') spacekey = false;
}
