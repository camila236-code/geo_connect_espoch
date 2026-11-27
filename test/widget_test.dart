import 'package:geo_connect_espoch/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Muestra el menú principal con los cinco módulos', (tester) async {
    await tester.pumpWidget(const GeoConnectApp());

    expect(find.text('Geo Connect ESPOCH'), findsOneWidget);
    expect(find.text('¿Qué necesitas hoy?'), findsOneWidget);
    expect(find.text('TalkBoard Connect'), findsOneWidget);
    expect(find.text('Voz a texto'), findsOneWidget);
    expect(find.text('GeoESPOCH'), findsOneWidget);
    expect(find.text('Alertas'), findsOneWidget);
    expect(find.text('Configuración'), findsOneWidget);
  });
}
