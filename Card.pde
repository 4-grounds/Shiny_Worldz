class Card {

  color pix, c, pix2, pix3, pix4;
  float r, g, b, errR, errG, errB, firstR, firstG, firstB;
  int newR, newG, newB, chance;
  int factor = 3;

  int[][] matrix = {   
    {1, 9, 3, 11}, 
    {13, 5, 15, 7}, 
    {4, 12, 2, 10}, 
    {16, 8, 14, 6}
  };
  
  float mratio = 1.0 / 16;
  float mfactor = 255.0 / 4;

  //insert card names in this array
  public String[] cardz = {
    "addictsTrash.jpeg", 
    "fortressOfDead.jpeg", 
    "wasteNot.jpeg", 
    "home.jpeg", 
    "wetWinter.jpeg", 
    "slumberingHallz.jpeg", 
    "loneGuard.jpeg", 
    "aShow.jpeg", 
    "modernCastle.jpeg", 
    "jailed_growth_decay.jpeg", 
    "speedingLife.jpeg",
    "peAce.jpeg",
    "modernPond.jpeg",
    "coastBridge.jpeg"
  };

  Card() {}

  Card(int pack) {pic = loadImage(cardz[pack]);}
  
  void display() {image(pic, 0, 0, width, height);}

  void nextCard(int pack, int chance) {

    pic = loadImage(cardz[pack]);

    this.chance = chance;
  }

  int index(int x, int y) {return x + y * pic.width;}

  int getChance() {return chance;}
  
  int getCardPool() {return cardz.length;}

  //Thershold Dithering
  void dithering1() {
    for (int y = 0; y < pic.height -1; y++) {
      for (int x = 1; x < pic.width - 1; x++) {
        pix = pic.pixels[index(x, y)];

        firstR = red(pix);
        firstG = green(pix);
        firstB = blue(pix);

        newR = round(factor * firstR / 255) * (255 / factor);
        newG = round(factor * firstG / 255) * (255 / factor);
        newB = round(factor * firstB / 255) * (255 / factor);

        pic.pixels[index(x, y)] = color(newR, newG, newB);
      }
    }
  }

  //Floyd–Steinberg Dithering
  void dithering2() {
    for (int y = 0; y < pic.height -1; y++) {
      for (int x = 1; x < pic.width - 1; x++) {
        pix = pic.pixels[index(x, y)];

        // original colors
        firstR = red(pix);
        firstG = green(pix);
        firstB = blue(pix);

        // new colors
        newR = round(factor * firstR / 255) * (255 / factor);
        newG = round(factor * firstG / 255) * (255 / factor);
        newB = round(factor * firstB / 255) * (255 / factor);

        // error
        errR = firstR - newR; 
        errG = firstG - newG; 
        errB = firstB - newB; 

        // right pixel
        c = pic.pixels[index(x + 1, y)];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 7 / 16.0;
        g = g + errG * 7 / 16.0;
        b = b + errB * 7 / 16.0;
        pic.pixels[index(x + 1, y)] = color(r, g, b);

        // bottom left pixel
        c = pic.pixels[index(x - 1, y + 1)];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 3 / 16.0;
        g = g + errG * 3 / 16.0;
        b = b + errB * 3 / 16.0;
        pic.pixels[index(x - 1, y + 1)] = color(r, g, b);

        // bottom pixel
        c = pic.pixels[index(x, y + 1)];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 5 / 16.0;
        g = g + errG * 5 / 16.0;
        b = b + errB * 5 / 16.0;
        pic.pixels[index(x, y + 1)] = color(r, g, b);

        // bottom right pixel
        c = pic.pixels[index(x + 1, y + 1)];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 1 / 16.0;
        g = g + errG * 1 / 16.0;
        b = b + errB * 1 / 16.0;
        pic.pixels[index(x + 1, y + 1)] = color(r, g, b);
      }
    }
  }

  //Bayer Matrix
  void dithering3() {
    for (int x = 0; x < pic.width; x++) {
      for (int y = 0; y < pic.height; y++) {
        pix = pic.pixels[index(x, y)];
        
        color value = color(brightness(pix) + (mratio * matrix[x % 2][y % 2] * mfactor));
        
        if (brightness(value) < 128) {
          value = color(0);
        } else {
          value = color(255);
        }

        color newpixel = value;

        pic.pixels[index(x, y)] = newpixel;
      }
    }
  }
}
