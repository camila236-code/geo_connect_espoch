import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// Preferencias básicas de accesibilidad. La persistencia con Hive llega después.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _altoContraste = false;
  double _tamanoTexto = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Volver al menú',
          onPressed: () => context.go('/home'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Semantics(
            header: true,
            child: Text(
              'Accesibilidad',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Alto contraste'),
            subtitle: const Text('Aumenta el contraste de la interfaz'),
            value: _altoContraste,
            onChanged: (valor) => setState(() => _altoContraste = valor),
          ),
          const SizedBox(height: 16),
          Semantics(
            label: 'Tamaño de texto ${_tamanoTexto.toStringAsFixed(1)} veces',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tamaño de texto: ${_tamanoTexto.toStringAsFixed(1)}x',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Slider(
                  min: 0.8,
                  max: 1.6,
                  divisions: 8,
                  value: _tamanoTexto,
                  onChanged: (valor) => setState(() => _tamanoTexto = valor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Estas preferencias se guardarán con Hive en la siguiente fase. Permisos de GPS, micrófono y notificaciones se solicitan al usar cada módulo.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
