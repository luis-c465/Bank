public class Deck extends CardHolder {
  // * DRAWING CONSTANTS
  public static final int x_deck = 20;
  public int y_deck = m.h - Card.h;

  public static final int x_txt = 20;
  public int y_txt = y_deck - 30;

  // int x_hand;
  // int y_hand = 500;

  // public Card moving;
  // public PImage moving_img;

  public Deck(Snap app) {
    super(app);
  }

  protected void _update() {
    textAlign(CORNERS);
    textSize(32);
    text("" + cards.size() + " cards", x_txt, y_txt);

    // Draw the deck
    if (cards.size() >= 1) {
      imageMode(CORNER);
      image(a.back, x_deck, y_deck, Card.w, Card.h);
    }
  }

  protected void drawHand() {
    // if (!m.flip) {
    //   image(a.back, x_hand, y_hand, Card.w, Card.h);
    // } else {
    //   // guh flip the thing
    //   image(hand_img, x_hand, y_hand, Card.w, Card.h);

    //   // Move the card
    //   if (flipCycles != flip_cycles_end) {
    //     x_hand += hand_x_step;
    //     flipCycles++;
    //   } else {
    //     if (cycles_next_round != cycles_next_round_end) {
    //       cycles_next_round++;
    //     } else {
    //       nextRound();
    //     }
    //   }
    // }

  }

  private void updateHandImg() {
    // hand_img = a.getCard(hand);
  }

  /**
   * Should handle the case where this is the last round
  */
  private void nextRound() {
    // if (flipCycles_back != flip_cycles_end) {
    //   m.isFlippingHandBack = true;

    //   flipCycles_back++;
    //   y_hand += hand_y_step;
    // } else {
    //   m.isFlippingHandBack = false;
    //   m.nextRound = true;
    // }
  }

  /**
   * Shold be called when the transitions are done
   * Updates the palyers cards and resets all local variables
  */
  private void hardNextRound() {
    // player.hand = hand;

    // hand = cards.remove();
    // updateHandImg();

    // m.flip = false;
    // m.isFlippingHand = false;
    // m.isFlippingHandBack = false;

    // m.hasVoted = false;

    // m.nextRound = false;

    // x_hand = x_deck;
    // y_hand = y_deck;

    // flipCycles = 0;
    // flipCycles_back = 0;
    // cycles_next_round = 0;
  }
}
