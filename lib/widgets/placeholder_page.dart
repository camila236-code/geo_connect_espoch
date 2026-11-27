import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

/// Pantalla temporal para módulos que aún implementan otros integrantes.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.icono,
    required this.color,
  });

  final String titulo;
  final String descripcion;
  final IconData icono;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          header: true,
          child: Text(titulo),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Volver al menú',
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Semantics(
            label: '$titulo. $descripcion',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icono, size: 96, color: color),
                const SizedBox(height: 24),
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  descripcion,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => context.go('/home'),
                  icon: const Icon(Icons.home),
                  label: const Text('Volver al menú'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
