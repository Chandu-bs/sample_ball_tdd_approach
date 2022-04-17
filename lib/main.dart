import 'dart:math';
import 'constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: kAppBarColor,
            title: kAppBarText,
            centerTitle: true),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: kBgImage,
              fit: BoxFit.cover,
            )),
            child: BallPage()),
      ),
    );
  }
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballImageNumber = 1;

  @override
  void initState() {
    changeBallNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
                key: kButtonKey,
                onPressed: () {
                  changeBallNumber();
                },
                child: Image.asset('images/ball$ballImageNumber.png')),
          )
        ],
      ),
    );
  }

  int generateBallNumber() {
    return Random().nextInt(5) + 1;
  }

  void changeBallNumber() {
    setState(() {
      ballImageNumber = generateBallNumber();
    });
  }
}
