public class Deck extends CardHolder {
  // * DRAWING CONSTANTS
  final int x_deck = 20;
  final int y_deck = 0;

  int x_hand;
  int y_hand = 500;

  public Card moving;
  public PImage moving_img;

  public final int flip_cycles_end = 5;
  public int flipCycles = 0;

  public int flipCycles_back = 0;

  public final int cycles_next_round_end = 60;
  public int cycles_next_round = 0;

  public int hand_x_step;
  public int hand_y_step;

  /**
   * Generates a deck then shuffles it
   */
  public Deck(Snap app) {
    super(app);
  }

  public String toString() {
    return cards.toString();
  }

  public void setup() {
    // x_hand = x_deck;

    // int dx = v.cw - x_deck ;
    // hand_x_step = dx / flip_cycles_end;

    // int dy = Player.y_hand - y_deck;
    // hand_y_step = dy / flip_cycles_end;
  }

  public void _update() {
    // if (v.nextRound) {
    //   hardNextRound();
    // }

    // drawHand();
    // drawDeck();

    // if (v.hasVoted && !v.isFlippingHand) {
    //   v.flip = true;
    //   v.isFlippingHand = true;
    // }
  }

  protected void drawDeck() {
    push();

    // If cards are left in the deck
    if (cards.size() > 0) {
      image(a.back, x_deck, y_deck, Card.w, Card.h);
    }

    pop();
  }

  protected void drawHand() {
    // if (!v.flip) {
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
    //   v.isFlippingHandBack = true;

    //   flipCycles_back++;
    //   y_hand += hand_y_step;
    // } else {
    //   v.isFlippingHandBack = false;
    //   v.nextRound = true;
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

    // v.flip = false;
    // v.isFlippingHand = false;
    // v.isFlippingHandBack = false;

    // v.hasVoted = false;

    // v.nextRound = false;

    // x_hand = x_deck;
    // y_hand = y_deck;

    // flipCycles = 0;
    // flipCycles_back = 0;
    // cycles_next_round = 0;
  }
}
