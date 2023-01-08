public class Location extends Clickable {
  public LinkedList<CardInfo> cards = new LinkedList();

  public int i = -1;
  protected boolean queened = false;
  protected int len;
  protected int p1Scor = 0;
  protected int p2Scor = 0;

  public static final int space = 200;
  public static final int gap = 100;

  // ? Numbers are wierd because Processing moment
  public int y_score_above = Snap.ch - Card.h - 20;
  public int y_score_bellow = Snap.ch + Card.h + 20;

  // Cards
  public static final int cards_gap = 4;
  public static final int cards_space = 70;
  public static final int cards_size = 40;
  public int cards_y_above = y_score_above + cards_space;
  public int cards_y_bellow = y_score_bellow - cards_space;
  public int cards_h = (int) (cards_size * Card._ratio);


  protected void _setup() {
    x = m.cw + space * i;
    y = m.ch;

    w = Card.w;
    h = Card.h;
  }

  protected void _update() {
    // Draw the image
    imageMode(CENTER);
    image(
      getTop(),
      x,
      y,
      Card.w,
      Card.h
    );

    // show the current players cards score bellow the card
    // show the other players score above the card
    textAlign(CENTER);
    textSize(40);
    if (curTurn == 1) {
      text("" + p1Scor, x, y_score_bellow);
      text("" + p2Scor, x, y_score_above);
    } else if (curTurn == 2) {
      text("" + p2Scor, x, y_score_bellow);
      text("" + p1Scor, x, y_score_above);
    }

    // Draw the icons
    for(int i=-1; i<3; i++) {
      int x = this.x + i*(cards_gap + cards_size) - cards_size / 2;

      int index = i + 1;
      boolean exists = index < len;
      shapeMode(CENTER);
      imageMode(CENTER);

      if (exists) {
        CardInfo cc = cards.get(index);
        if (cc.player.num == m.curTurn) {
          image(a.getCard(cc), x, cards_y_bellow, cards_size, cards_h);
        } else {
          image(a.getCard(cc), x, cards_y_above, cards_size, cards_h);
        }
      } else {
        shape(a.cardEmpty, x, cards_y_bellow, cards_size, cards_size);
      }

    }

    // If the location was clicked on
    // and the card index is a valid card
    // and the curent turn is -1 (to prevent crashes)
    // and the number of cards already on the location is bellow the limit
    // ! OR the card is a special card and WILL NOT be added to the pile
    if (
      clicked &&
      m.curCardIndex >= 0 &&
      curTurn != -1 &&
      (cards.size() < 4 || m.curPlayer.hand.cards.get(curCardIndex).num >= Card.jack)
    ) {
      // handle adding the card to that location based on the current player
      Card c = m.curPlayer.hand.cards.get(curCardIndex);

      if (handleCard(c)) {
        // Update global variables
        m.curPlayer.hand.cards.remove(curCardIndex);
        m.curCardIndex = -1;
        numTurns--;

        // Play a place sound effect
        a.place.jump(0);
      } else {
        // Play an error sound effect
        a.error.jump(0);
      }
    }
  }

  /**
   *  If the card is one of the special cards do something
   * @returns weather the curent card index and num turns should be updated
  */
  private boolean handleCard(Card c) {
    int len = cards.size();
    int lastI = len - 1;

    // Is a normal card so just add it to the pile
    if (c.num >= 1 && c.num <= 10) {
      if (len > 0) {
        Card prev = cards.get(lastI).card;
        if (prev.num == Card.ace && !prev.bad) {
          c.bad = true;
          c.num = 1;
        }
      }
      cards.add(new CardInfo(c, m.curPlayer));
      return true;
    }

    // Now if the card is special
    if (len <= 0) return false;

    if(c.num == Card.queen) {
      Card c2 = cards.get(lastI).card;
      c2.num -= 5;
      c2.queened = true;
      queened = true;
    } else if (c.num == Card.king) {
      cards.remove(lastI);
    } else if (c.num == Card.jack) {
      Location loc = randLocation();
      // This card cannot be placed
      // because there is nowhere to the card to move to!
      if (loc == null) {
        return false;
      }

      loc.cards.add(cards.remove(lastI));
    }

    return true;
  }

  /**
   * Returns a random location that is not the current one
   * and that has less than 4 placed cards on it
  */
  protected Location randLocation() {
    int index = int(random(-1, 2));
    Location loc = getLoc(index);
    final int maxTries = 15;
    int tries = 0;

    // The jack cannot move a cawrd to the same location or
    // a location with 4 or more cards (already full)
    while((index == i || loc.cards.size() >= 4) && tries < maxTries) {
      index = int(random(-1, 2));
      loc = getLoc(index);
      tries++;
    }

    if (tries >= maxTries) {
      return null;
    }

    return getLoc(index);
  }

  protected Location getLoc(int i) {
    if (i == -1) {
      return m.l1;
    } else if (i == 0) {
      return m.l2;
    } else if (i == 1) {
      return m.l3;
    } else {
      // This shoundn't happen
      return null;
    }
  }

  protected void preUpdate() {
    super.preUpdate();
    calc();
  }

  public void calc() {
    if (cards.size() != len || queened) {
      p1Scor = 0;
      p2Scor = 0;

      for(CardInfo c : cards) {
        if (c.player.num == 1) {
          p1Scor += c.card.num;
        } else if (c.player.num == 2) {
          p2Scor += c.card.num;
        }
      }

      len = cards.size();
      queened = false;
    }
  }

  private PImage getTop() {
    if (cards.size() == 0) {
      return a.back;
    }

    Card c = (cards.get(cards.size() - 1)).card;
    return a.getCard(c);
  }

  public Location(Snap app, int i) { super(app); this.i = i; }
}
