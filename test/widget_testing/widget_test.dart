import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_ball_test/main.dart';
import 'package:sample_ball_test/constants.dart';

void main() {
// Checking the question text after the app gets started!
  testWidgets(
    "Check the question text",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final text = find.byWidget(kAppBarText);

      expect(text, findsOneWidget);
    },
  );

  //Checking the background image
  testWidgets(
    "Checking the background image",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(body: Container(decoration: const BoxDecoration()))));

      const childWidget =
          BoxDecoration(image: DecorationImage(image: kBgImage));

      expect(find.byWidget(childWidget as Image), findsOneWidget);
    },
  );

//checking the image at center after the app opened!
  testWidgets(
    "Checking the image",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.image(kFirstImage), findsOneWidget);
    },
  );

  //checking the functionality of flatbutton and checking the change in image.
  testWidgets(
    "Tap functionality",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      var myButton = find.byKey(kButtonKey);

      await tester.tap(myButton);
      await tester.pump();

      List<String> imageNames = [
        'ball1.png',
        'ball2.png',
        'ball3.png',
        'ball4.png',
        'ball5.png',
      ];
      var count = 0;

      for (String image in imageNames) {
        var matching =
            tester.widgetList(find.image(AssetImage("images/$image"))).length;
        count = count + matching;
      }

      expect(count, 1);
    },
  );
}
