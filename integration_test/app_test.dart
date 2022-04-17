import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sample_ball_test/main.dart' as app;
import 'package:sample_ball_test/constants.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //Checking the functionality of app by pressing the image at center and expecting it to change.
  final text = find.byWidget(kAppBarText);

  testWidgets(
    "Tap functionality",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

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

      await Future.delayed(const Duration(seconds: 3));

      expect(text, findsOneWidget);
      expect(count, 1);
    },
  );
}
