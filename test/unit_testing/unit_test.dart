import 'package:flutter_test/flutter_test.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sample_ball_test/main.dart';

class RandomNumberGenerator {
  RandomNumberGenerator(this.ballNumber);

  int ballNumber;

  int generateBallNumber() {
    return Random().nextInt(5) + 1;
  }

  void changeBallNumber() {
    ballNumber = generateBallNumber();
  }
}

//Check the function of changeBallNumber method.
void main() {
  test('checking the random number generating method', (() {
//setup

    RandomNumberGenerator findValue = RandomNumberGenerator(1);

//do

    findValue.changeBallNumber();

//test
    expect(findValue.ballNumber, inExclusiveRange(1, 6));
  }));
}
