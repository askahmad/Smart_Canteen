import 'package:flutter_test/flutter_test.dart';
import 'package:smart_canteen/main.dart';
import 'package:smart_canteen/screens/splash_screen.dart';
import 'package:smart_canteen/screens/sign_in_screen.dart';

void main() {
  testWidgets('Smart Canteen App launches and navigates to Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartCanteenApp());
    expect(find.byType(SplashScreen), findsOneWidget);

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.byType(SignInScreen), findsOneWidget);
  });
}
