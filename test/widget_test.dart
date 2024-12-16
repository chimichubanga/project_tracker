import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_tracker/src/app.dart'; // Импортируем правильно

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Строим приложение и запускаем фрейм
    await tester.pumpWidget(const App());

    // Проверяем, что счётчик начинается с 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Тапаем по иконке '+' и перерисовываем фрейм
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Проверяем, что счётчик увеличился
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}