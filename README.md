# Snap App

Snap Card game for AP Computer Science AB 2022-2023 in Ivan Rico's class

## Dependencies

- [Java 1.8](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html) or [higher](https://adoptium.net/)

## Building

- **Requires [Processing v3.5.1](https://processing.org/download)**
- Then in the processing app go to in the top bar: `Tools` -> `Install processing-java`
- ```bash
  make eclipse
  ```

- Then compile to a jar file in eclipse (**Instructions missing**)

## Downloading

**[Latest release](https://github.com/luis-c465/Snap/releases/latest)**

## Running

- ```bash
  java -jar Main.jar
  ```

## Project Requirements

Due: **Sun Jan 22 2023**

- 2 Players per game
- 7 cards in a deck, start with 5 (12 total card, 4 per location)
- Cards have values of 1-12
- 3 Locations
- 4 cards can be placed at each location
- Highest sum of cards wins location
- 1 card played on the first turn, 2 cards on the second turn, etc..
- 1 card randomly drawn each turn
- Ends after all cards played
- Can exit whenever
