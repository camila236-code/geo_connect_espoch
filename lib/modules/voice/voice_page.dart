import 'package:geo_connect_espoch/widgets/placeholder_page.dart';
import 'package:material_ui/material_ui.dart';

/// Espacio reservado al módulo STT que implementará Gaby (Prompt 5).
class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      titulo: 'Voz a texto',
      descripcion: 'Aquí Gaby integrará speech_to_text: dictado en español, permiso de micrófono y campo editable.',
      icono: Icons.mic_none_rounded,
      color: Color(0xFF1565C0),
    );
  }
}
