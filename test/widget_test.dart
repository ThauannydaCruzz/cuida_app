// test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:cuida_app/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Constrói nosso app e dispara um frame.
    // A principal correção é trocar MyApp por CuidaApp.
    await tester.pumpWidget(const CuidaApp());

    // Verifica se o texto 'Login' (que está no nosso botão) aparece na tela.
    // Isso confirma que a tela de login foi carregada corretamente.
    expect(find.text('Login'), findsOneWidget);
  });
}
