import 'package:flutter_test/flutter_test.dart';
import 'package:smart_canteen/main.dart';
import 'package:smart_canteen/views/splssh_view.dart';
import 'package:smart_canteen/views/sign_in_view.dart';

void main() {
  testWidgets('Smart Canteen App launches and navigates with GetX', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartCanteenApp());
    expect(find.byType(SplsshView), findsOneWidget);

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.byType(SignInView), findsOneWidget);
  });
}
