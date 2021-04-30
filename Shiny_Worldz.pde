/*
Artist: Ian Van Meter
Date: 5-7-2020
Title: "Shiny_Worldz"
*/

PImage pic;

int shift, variance, pack, chance;

Card pull;
Card setter = new Card();

FoilEffectz shine;

ArrayList<Card> deck = new ArrayList<Card>();

void setup() {
  
  size(950, 700, JAVA2D);
  frameRate(2);

  variance = int(random(setter.getCardPool()));

  pack = constrain(variance, 0, setter.getCardPool());

  pull = new Card(pack);

  deck.add(pull);
  
  println(pull.cardz[pack]);
}

void draw() { 

  if (deck.size() == 1 || deck.size() == 4) {
    pull.dithering3();
  }

  if (deck.size() == 2 || deck.size() == 5) {
    pull.dithering1();
  }
  
  if (deck.size() == 3 || deck.size() == 6) {
    pull.dithering2();
  }
  
  pull.display();
  
  if (deck.size() > 2)
    shine = new FoilEffectz(pull.getChance());

  if (shift == 12){
    changeCard();
    shift = 0;
  }

  if (deck.size() == 7)
    exit();

  shift++;
}

void changeCard() {
  
  variance = int(random(setter.getCardPool()));

  pack = constrain(variance, 0, setter.getCardPool());
  
  chance = int(random(1, 6));
  
  pull.nextCard(pack, chance);

  deck.add(pull);
  
  println(pull.cardz[pack]);
}
