import 'package:flutter_test/flutter_test.dart';

import 'package:taskflow/main.dart';

void main() {
  testWidgets('Navega del listado al detalle', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Mis tareas'), findsOneWidget);

    await tester.tap(find.text(demoTasks.first.title));
    await tester.pumpAndSettle();

    expect(find.text('Detalle de tarea'), findsOneWidget);
  });
}