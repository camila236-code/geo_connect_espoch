import 'package:geo_connect_espoch/widgets/placeholder_page.dart';
import 'package:material_ui/material_ui.dart';

/// Espacio reservado a alertas con Firestore/FCM (Anónimo, Prompt 4).
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      titulo: 'Alertas',
      descripcion: 'Aquí Anónimo integrará el envío de ayuda con ubicación, confirmación, cola offline y notificaciones FCM.',
      icono: Icons.help_outline_rounded,
      color: Color(0xFFC62828),
    );
  }
}
