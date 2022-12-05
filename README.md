# Banking Application

Banking Application for AP Computer Science AB 2022-2023 in Ivan Rico's class

## Dependencies

- Java 1.8 or higher

## Building

- **Requires [Processing v3.5.1](https://processing.org/download)**
- Then in the processing app go to in the top bar: `Tools` -> `Install processing-java`
- ```bash
  make eclipse
  ```

- Then compile to a jar file in eclipse (**Instructions missing**)

## Downloading

**[Latest release](https://github.com/luis-c465/BankApp/releases/latest)**

## Running

- ```bash
  java -jar Main.jar
  ```

## Project Requirements

Due: **Sun Dec 11 2022**

- Has a login screen with user: admin and password: password
- Can select from at least 5 different customers
- Each customer shows a different name, amount, bank id and frozen status
- First user’s balance is negative
- Can deposit money
- Can withdraw money only if balance is positive
- Can add a user given the name, amount, bank id and balance
- Can freeze any account
- Can remove a user
- Can exit at any time
