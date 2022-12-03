# High Low Card Game

Card game for AP Computer Science AB 2022-2023 in Ivan Rico's class

## Dependencies

- Java 1.8 or higher

## Building

- **Requires [Processing v3.5.1](https://processing.org/download)**
- Then in the processing app go to in the top bar: `Tools` -> `Install processing-java`
- ```bash
  make eclipse
  ```

- Then compile to a jar file in eclipse (**Instructions missing**)
<!-- - Then `Main.jar` will be in the `build` folder -->

## Running

- Download (or build as seen above) `Main.jar` then run
- ```bash
  java -jar Main.jar
  ```

## Project Requirements

- Random positions of cards
- 52 cards, but 7 rounds
- 4 Suits (clubs, spades, hearts, diamonds)
- A-10, J, Q, K
- Tracks total correct
- Tracks current streak
- Tracks highest streak
- Calculated score with bonus based on streak (ex: +50% bonus score each time streak increases)
- Can view score, total correct and highest streak for each player (this does not have to carry over when you close the app)
- Can exit game at any point
