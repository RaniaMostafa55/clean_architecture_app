import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/app/app.dart';
import 'package:my_app/features/main_user_screen/presentation/view/product_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(ProductsPage), findsOneWidget);
    });
  });
}
