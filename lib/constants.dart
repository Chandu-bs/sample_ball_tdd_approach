import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

int ballImageNumber = 1;

const kAppBarText = Text(
  'Ask me anything',
  key: Key('AppBar_Text'),
);
const kAppBarColor = Colors.blueAccent;
const kBgImage = AssetImage('images/pic.jpg');
final kBallImage = Image.asset('images/ball$ballImageNumber.png');
const kButtonKey = Key('button');
const kFirstImage = AssetImage('images/pic.jpg');
